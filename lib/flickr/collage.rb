module Flickr
  module Collage
    def self.root
      File.expand_path('../..', File.dirname(__FILE__))
    end

    def self.config
      Config.instance
    end

    def self.silence_warnings(&block)
      warn_level = $VERBOSE
      $VERBOSE = nil
      result = block.call
      $VERBOSE = warn_level
      result
    end
  end
end

require 'flickr/collage/version'
require 'flickr/collage/config'
require 'flickr/collage/dictionary'
require 'flickr/collage/photo'
require 'flickr/collage/service'
require 'flickr/collage/maker'