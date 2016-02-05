module Flickr
  module Collage
    def self.root
      File.expand_path('../..', File.dirname(__FILE__))
    end

    def self.config
      Config.instance
    end
  end
end

require 'flickr/collage/version'
require 'flickr/collage/config'
require 'flickr/collage/dictionary'
require 'flickr/collage/photo'
require 'flickr/collage/service'