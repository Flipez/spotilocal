# Spotilocal
[![Gem Version](https://badge.fury.io/rb/spotilocal.svg)](https://badge.fury.io/rb/spotilocal)
[![Build Status](https://travis-ci.org/Flipez/spotilocal.svg?branch=master)](https://travis-ci.org/Flipez/spotilocal)
[![Code Climate](https://codeclimate.com/github/Flipez/spotilocal/badges/gpa.svg)](https://codeclimate.com/github/Flipez/spotilocal)

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
### Library
You can specify a port to create the instance faster. Otherwise spotilocal will try to discover the port.
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

### Cli
Spotilocal comes with a thor cli. The cli is currently a bit slow due to port autodiscover. You can use it like this

```bash
spotilocal play URI # plays uri
spotilocal pause    # guess what
spotilocal unpause  # yup..
```

To display or fetch information about the current status you can use `spotilocal current [RESOURCE]`
Available resources are *album*, *track* and *artist*

```bash
spotilocal current album | jq
# {
#   "name": "Die bekannteste unbekannte Band der Welt",
#   "uri": "spotify:album:6EcMsNVKYMpA2Kqi1GSUAA"
# }

spotilocal current artist | jq
# {
#   "name": "SDP",
#   "uri": "spotify:artist:1EfwyuCzDQpCslZc8C9gkG"
# }

spotilocal current track | jq
# {
#   "name": "Wenn ich groß bin",
#   "uri": "spotify:track:5oEoQtl4qDwR7kstlTTBRu",
#   "length": 206,
#   "type": "normal"
# }
```

If you only want one specific information you can use `--only` or `-o`

```bash
spotilocal current track -o name
#> Wenn ich groß bin
```

Thor allows argument guessing. So commands like `spotilocal un` will work too.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Flipez/spotilocal.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
