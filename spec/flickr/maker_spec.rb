require 'spec_helper'

describe Flickr::Collage::Maker do
  subject{ Flickr::Collage::Maker.new(Flickr::Collage::Service.new) }
  let(:output_filename) { 'test.jpg' }
  #TODO: stub client

  it 'writes image to a given file' do
    subject.service.top_photos
    subject.create(output: output_filename)
    expect(Magick::Image.read(output_filename).first.format).to eq('JPEG')
    File.delete(output_filename)
  end
end