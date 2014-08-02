# encoding: utf-8

require "evernote_oauth"
require "yoyo"

module Envryo
  class Notifier
    def initialize(config = {})
      evernote = EvernoteOAuth::Client.new(:token => config[:evernote_token])
      @note_store = evernote.note_store
      if config[:evernote_filter]
        @filter = Evernote::EDAM::NoteStore::NoteFilter.new.tap do |filter|
          filter.words     = config[:evernote_filter]
          filter.order     = Evernote::EDAM::Type::NoteSortOrder::UPDATE_SEQUENCE_NUMBER
          filter.ascending = false
        end

        @result_spec = Evernote::EDAM::NoteStore::NotesMetadataResultSpec.new.tap do |spec|
          spec.includeUpdateSequenceNum = true
        end
      end

      @yo = Yoyo::Yo.new(config[:yo_api_key])
      @yo_user = config[:yo_user]

      @interval = config[:interval] || 300
    end

    def run
      setup

      loop do
        if updated? && detect_event?
          notify
        end
        sleep @interval
      end
    end

    def setup
      raise 'NoteStore not found' unless @note_store
      @update_count = current_state.updateCount
      nil
    end

    def updated?
      @latest_count, @update_count = @update_count, current_state.updateCount

      @latest_count != @update_count
    end

    def detect_event?
      return true unless @filter

      metadata = @note_store.findNotesMetadata(@filter, 0, 1, @result_spec)
      metadata.notes.any? {|note| note.updateSequenceNum > @latest_count }
    end

    def notify
      @yo_user ? @yo.yo(@yo_user) : @yo.yo_all
    end

    private

    def current_state
      @note_store.getSyncState
    end
  end
end
