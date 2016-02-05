# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flickr/collage/version'

Gem::Specification.new do |spec|
  spec.name          = 'flickr-collage'
  spec.version       = Flickr::Collage::VERSION
  spec.authors       = ['Dieter Pisarewski']
  spec.email         = ['dieter.pisarewski@gmail.com']

  spec.summary       = "A command line tool to create a collage from flickr photos."
  spec.description   = "Finds the most interesting photos on flickr by given keywords and creates a photo collage from the photos."
  spec.homepage      = 'https://github.com/dpisarewski/flickr-collage'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'flickraw'
  spec.add_runtime_dependency 'rmagick-screwdrivers'
  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'hashie'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
