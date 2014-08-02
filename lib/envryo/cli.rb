# encoding: utf-8

require "yaml"
require "optparse"

module Envryo
  class CLI
    def self.call(argv = ARGV)
      options = ARGV.getopts('c:', 'config:')
      config_file = options['c'] || options['config']

      unless config_file
        puts "Usage: #{$0} --config=CONFIG"
        exit 1
      end

      config = YAML.load_file(config_file)

      # symblize keys
      config = config.inject({}) do |h, (k, v)|
        h.merge(k.to_sym => v)
      end

      Envryo::Notifier.new(config).run
    end
  end
end
