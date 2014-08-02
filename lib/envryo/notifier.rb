# encoding: utf-8

require "evernote_oauth"
require "yoyo"

module Envryo
  class Notifier
    def initialize(config = {})
      evernote = EvernoteOAuth::Client.new(:token => config[:evernote_token])
      @note_store = evernote.note_store

      @yo = Yoyo::Yo.new(config[:yo_api_key])
      @yo_user = config[:yo_user]

      @interval = config[:interval] || 300
    end

    def run
      setup

      loop do
        notify if updated?
        sleep @interval
      end
    end

    def setup
      raise 'NoteStore not found' unless @note_store
      @update_count = current_state.updateCount
      nil
    end

    def updated?
      old_count, @update_count = @update_count, current_state.updateCount

      old_count != @update_count
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
