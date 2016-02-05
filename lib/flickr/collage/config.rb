require 'singleton'
require 'hashie'
require 'yaml'
require 'forwardable'

module Flickr
  module Collage
    class Config
      extend Forwardable
      include Singleton

      DEFAULT_CONFIG_FILENAME = 'flickr-collage.yml'
      DEFAULT_CONFIG_PATH     = File.join(Collage.root, 'config', DEFAULT_CONFIG_FILENAME)

      attr_accessor :data
      delegate [:api_key, :secret] => :settings

      def settings
        self.data ||= load
      end

      def settings=(hash)
        self.data = Hashie::Mash.new(hash)
      end

      def load(config_path = DEFAULT_CONFIG_PATH)
        self.data = Hashie::Mash.load(config_path)
      end

      def save(hash, config_path = DEFAULT_CONFIG_PATH)
        File.open(config_path, 'w') do |file|
          file.write(YAML.dump(hash))
        end
      end
    end
  end
end