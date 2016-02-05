require 'spec_helper'

describe Flickr::Collage do
  it 'has a version number' do
    expect(Flickr::Collage::VERSION).not_to be nil
  end

  it 'config is available' do
    expect(Flickr::Collage.config).to be
  end

  it 'sets logger to warn level' do
    expect(Flickr::Collage.logger.level).to eq(Logger::WARN)
  end
end
