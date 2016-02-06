require 'singleton'
require 'hashie/mash'
require 'yaml'
require 'forwardable'

module Flickr
  module Collage
    class Config
      extend Forwardable
      include Singleton

      DEFAULT_CONFIG_FILENAME = 'flickr-collage.yml'
      DEFAULT_CONFIG_PATH     = File.join(Collage.root, 'config', DEFAULT_CONFIG_FILENAME)
      CONFIG_OPTIONS          = %w[api_key secret]

      attr_accessor :data
      delegate CONFIG_OPTIONS => :settings

      def settings
        self.data ||= load
      end

      def settings=(hash)
        filtered = hash.reject{ |k, v| !CONFIG_OPTIONS.include?(k.to_s) }
        self.data = Hashie::Mash.new(filtered)
      end

      def load(config_path = DEFAULT_CONFIG_PATH)
        return Hashie::Mash.new unless File.exist?(config_path)

        self.data = Hashie::Mash.new(YAML.load_file(config_path))
      end

      def save(hash, config_path = DEFAULT_CONFIG_PATH)
        self.settings = hash

        File.open(config_path, 'w') do |file|
          file.write(YAML.dump(data.to_hash))
        end
      end
    end
  end
end