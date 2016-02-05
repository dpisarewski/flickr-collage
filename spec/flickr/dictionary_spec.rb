require 'spec_helper'

describe Flickr::Collage::Dictionary do
  subject{ Flickr::Collage::Dictionary.new }

  it 'counts words' do
    expect(subject.size).to be_a(Integer)
  end

  it 'returns a word' do
    expect(subject.random_word).not_to be_empty
  end

  it 'returns random words' do
    word1 = subject.random_word
    word2 = subject.random_word
    expect(word1).not_to eq(word2)
  end
end