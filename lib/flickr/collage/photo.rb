require 'hashie/mash'

module Flickr
  module Collage
    class Photo < Hashie::Mash
      def filename
        File.basename(url)
      end
    end
  end
end
