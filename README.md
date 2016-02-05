# Flickr::Collage

## Installation

Follow [Prerequisits](https://github.com/rmagick/rmagick#prerequisites) section for [RMagick](https://github.com/rmagick/rmagick) in order to install image processor.

Add this line to your application's Gemfile:

```ruby
gem 'flickr-collage'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flickr-collage

## Usage

### From command line: 

Getting help.

    flickr-collage

Save credentials for [Flickr API](https://www.flickr.com/services/api/).

    flickr-collage config --api_key YOUR_API_KEY --secret YOUR_SECRET
    
Create a collage.

    flickr-collage create [FILENAME] [--amount=N] [--columns=N] [--keywords=ONE "SECOND KEYWORD" THIRD] [--thumb_widht=N] [--api_key YOUR_API_KEY] [--secret YOUR_SECRET]
    
Defaults:
 
    filename    - collage.png
    amount      - 10
    columns     - 5
    keywords    - random keywords from `/usr/share/dict/words`
    thumb_width - 300
    
### Using Flickr::Collage API

Save credentials for [Flickr API](https://www.flickr.com/services/api/).

    Flickr::Collage.config.save(api_key: YOUR_KEY, secret: YOUR_SECRET)
    
Create a collage.

    service = Flickr::Collage::Service.new(NUMBER_OF_PHOTOS) #NUMBER_OF_PHOTOS is optional, default is 10.
    service.top_photos(KEYWORDS)  #KEYWORDS is optional, by default it picks random words
    maker = Flickr::Collage::Maker.new(service)
    maker.create(options)
    
Options:
    
    output        - filename for output, default is `collage.png`   
    amount        - number of photos on the collage, default is 10
    columns       - number of columns on the collage, default is 5
    thumb_width   - width of thumbnails, default is 300
    scale_range   - default is 0.2
    rotate_angle  - default is 0
    background    - background color, default is 'white'
    border        - border color, default is '#DDDDDD'
    
    
## Development

After checking out the repo, run `bundle` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/flickr-collage. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

