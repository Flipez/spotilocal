# Spotilocal
[![Build Status](https://travis-ci.org/Flipez/spotilocal.svg?branch=master)](https://travis-ci.org/Flipez/spotilocal)

Spotilocal allows you to query the local spotify client and fetch informations about the current status and perform actions such as start/stop.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spotilocal'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spotilocal

## Usage

Currently you have to enter the port manually. Autodiscover is planned.
```ruby
# Create a new spotify object
s = Spotilocal::Client.new port: 4382
```

After that you can simply fetch some informations.
```ruby
s.status
s.pause   # true if paused
s.unpause # true if playing
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Flipez/spotilocal.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

