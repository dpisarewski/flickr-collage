require 'flickraw'
require 'open-uri'
require 'forwardable'

module Flickr
  module Collage
    class Service
      extend Forwardable

      DEFAULT_PHOTOS_AMOUNT = 10
      attr_accessor :photos, :photos_amount

      def initialize(photos_amount = nil)
        self.photos_amount  = photos_amount || DEFAULT_PHOTOS_AMOUNT
        self.photos         = []
        FlickRaw.api_key        = Collage.config.api_key
        FlickRaw.shared_secret  = Collage.config.secret
      end

      def top_photos(*keywords)
        self.photos = []
        buffer  = keywords.compact.dup
        dict    = Dictionary.new

        while photos.size < photos_amount
          buffer << dict.random_word if buffer.empty?
          keyword = buffer.shift
          Collage.logger.info("New keyword: #{keyword}")
          photo   = top_photo(keyword)
          photos << photo if photo
        end

        photos
      end

      def top_photo(keyword)
        #option :text returns better results than :tags
        options = {text: keyword, per_page: 1, page: 1, sort: 'interestingness-desc', content_type: 1, media: :photos}
        list    = flickr.photos.search(options)
        return if list.to_a.empty?

        photo_info  = flickr.photos.getInfo(photo_id: list.first['id'])
        photo       = Photo.new(photo_info.to_hash)
        photo.url   = FlickRaw.url_b(photo_info)
        photo
      end

      def download(dir)
        fail('No photos available') if photos.empty?

        photos.each do |photo|
          file = open(photo.url)
          File.open(File.join(dir, photo.filename), 'wb') do |f|
            f.write(file.read)
          end
        end
      end
    end
  end
end
