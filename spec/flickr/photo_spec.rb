require 'spec_helper'

describe Flickr::Collage::Photo do
  subject{ Flickr::Collage::Photo.new }
  let(:url) { 'https://farm4.staticflickr.com/3893/14251110570_27f8d20cc6_b.jpg' }

  it 'extracts filename from url' do
    subject.url = url
    expect(subject.filename).to eq('14251110570_27f8d20cc6_b.jpg')
  end
end