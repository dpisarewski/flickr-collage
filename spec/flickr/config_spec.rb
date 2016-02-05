require 'spec_helper'

describe Flickr::Collage::Config do
  subject { Flickr::Collage::Config.instance }
  after   { Singleton.__init__(Flickr::Collage::Config) }

  let(:new_settings)      { {api_key: 'test', secret: 'test'} }
  let(:invalid_settings)  { {my_key: false} }
  let(:test_config_path)  { 'config/test.yml' }

  it 'loads settings' do
    expect(subject.settings).to have_key(:api_key)
    expect(subject.settings).to have_key(:secret)
  end

  it 'delegates methods for settings to the settings hash' do
    expect(subject.settings.api_key).to eq(subject.api_key)
    expect(subject.settings.secret).to eq(subject.secret)
  end

  it 'stores new settings' do
    expect{
      subject.settings = new_settings
    }.to change(subject, :api_key).to(new_settings[:api_key])
  end

  it 'saves settings' do
    expect{
      subject.save(new_settings, test_config_path)
      subject.load(test_config_path)
      File.delete(test_config_path)
    }.to change(subject, :api_key).to(new_settings[:api_key])
  end

  it 'saves only defined options' do
    subject.save(invalid_settings, test_config_path)
    subject.load(test_config_path)
    File.delete(test_config_path)
    expect(subject.api_key).to be_nil
  end
end