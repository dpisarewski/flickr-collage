require 'rmagick/screwdrivers'

module Flickr
  module Collage
    class Maker
      DEFAULT_FILENAME = 'collage.png'
      attr_accessor :service

      def initialize(service)
        self.service = service
      end

      def create(output_path = DEFAULT_FILENAME, options = {})
        options = {columns: 5, rotate_angle: 0, scale_range: 0.2, thumb_width: 300}.merge(options)

        Dir.mktmpdir do |dir|
          service.download(dir)
          Magick::Screwdrivers.collage(dir, options).write(output_path)
        end
      end
    end
  end
end