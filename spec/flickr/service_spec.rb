require 'spec_helper'

describe Flickr::Collage::Service do
  subject { Flickr::Collage::Service.new }
  let(:top_photo) { subject.top_photo('hamburg') }
  #TODO: stub client

  context 'Initializer' do
    before do
      FlickRaw.api_key        = nil
      FlickRaw.shared_secret  = nil
    end

    it 'sets flickr api_key' do
      expect{ subject }.to change(FlickRaw, :api_key)
      expect(FlickRaw.api_key).to be
    end

    it 'sets flickr secret' do
      expect{ subject }.to change(FlickRaw, :shared_secret)
      expect(FlickRaw.shared_secret).to be
    end
  end

  it 'retrieves a photo for a give keyword from flickr' do
    expect(top_photo).to be_a(Flickr::Collage::Photo)
  end

  it 'retrieved photo contains a url to the file' do
    expect(top_photo.url).to be_url
  end

  it 'retrieves 10 photos' do
    expect(subject.top_photos(%w[hamburg berlin]).size).to eq(10)
  end

  it 'downloads photos to a given directory' do
    Dir.mktmpdir do |dir|
      subject.top_photos
      subject.download(dir)
      expect(dir).not_to be_empty
    end
  end
end