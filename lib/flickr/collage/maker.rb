Flickr::Collage.silence_warnings do
  require 'rmagick/screwdrivers'
end

module Flickr
  module Collage
    class Maker
      DEFAULT_FILENAME = 'collage.png'
      DEFAULT_OPTIONS  = {output: DEFAULT_FILENAME, columns: 5, rotate_angle: 0, scale_range: 0.2, thumb_width: 300}
      attr_accessor :service

      def initialize(service)
        self.service = service
      end

      def create(options = {})
        options = Hashie::Mash.new(options.reverse_merge(DEFAULT_OPTIONS))
        options = Hashie::Extensions::SymbolizeKeys.symbolize_keys(options.to_h)

        Dir.mktmpdir do |dir|
          service.download(dir)
          Magick::Screwdrivers.collage(dir, options).write(options[:output])
        end
      end
    end
  end
end