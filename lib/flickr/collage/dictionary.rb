module Flickr
  module Collage
    class Dictionary
      DEFAULT_DICT_FILE = '/usr/share/dict/words'
      attr_accessor :dict_filename

      def initialize(dict_filename = nil)
        self.dict_filename = dict_filename || DEFAULT_DICT_FILE
      end

      def size
        @size ||= File.open(dict_filename).inject(0) { |c, line| c + 1 }
      end

      def random_word
        prng    = Random.new
        number  = prng.rand(1..size).to_i

        File.open(dict_filename) do |file|
          #WARNING: too many IO operations
          #TODO: For small files only, load the the contents into memory. For large files, index lines or use database.
          #skip n - 1 lines
          (number - 1).times{ file.gets }
          #read line number and close the file
          next file.gets.chomp
        end
      end
    end
  end
end