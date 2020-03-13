# Rack::SimpleUserAgent

[![Gem Version](https://badge.fury.io/rb/rack-simple_user_agent.svg)](https://badge.fury.io/rb/rack-simple_user_agent)
[![Build Status](https://travis-ci.org/toshimaru/rack-simple_user_agent.svg)](https://travis-ci.org/toshimaru/rack-simple_user_agent)
[![Test Coverage](https://api.codeclimate.com/v1/badges/576b6f673fc00d07da0d/test_coverage)](https://codeclimate.com/github/toshimaru/rack-simple_user_agent/test_coverage)
[![Code Climate](https://codeclimate.com/github/toshimaru/rack-simple_user_agent/badges/gpa.svg)](https://codeclimate.com/github/toshimaru/rack-simple_user_agent)

Rack::SimpleUserAgent is Rack::Request extension which detects user-agent from user-agent string. No complicated logic for the detection, it simply(stupidly) checks if user-agent includes particular string or not.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'rack-simple_user_agent'
```

## Available Detection Methods

```
request ─ from_smartdevice?
        │ ├─ from_ios?
        │ ├─ from_android?
        │ └─ from_windows_phone?
        │
        ├ from_smartphone?
        │ ├─ from_android_mobile?
        │ ├─ from_iphone?
        │ ├─ from_ipod?
        │ └─ from_windows_phone?
        │
        ├ from_tablet?
        │ ├─ from_ipad?
        │ └─ from_android_tablet?
        │
        └ from_googlebot?
          ├─ from_googlebot_news?
          ├─ from_googlebot_images?
          └─ from_googlebot_video?
```

## Usage

### on Rails

Installing `rack-simple_user_agent` automatically makes all detection methods available.

#### Action Pack Variants Usage

These methods are useful when you use the Rails' [Action Pack Variants](http://guides.rubyonrails.org/4_1_release_notes.html#action-pack-variants) (as of Rails4.1).

```rb
class ApplicationController < ActionController::Base
  before_action :set_request_variant

  def set_request_variant
    request.variant = :smartphone if request.from_smartphone?
  end
end
```

Then, you can use two types of view. For example:

```
app/views/projects/show.html.erb
app/views/projects/show.html+smartphone.erb
```

### on Sinatra

```rb
require "sinatra"
require "rack/simple_user_agent"

configure do
  use Rack::SimpleUserAgent
end

get "/" do
  if request.from_smartphone?
    "Hello World from smartphone"
  elsif request.from_tablet?
    "Hello World from tablet"
  else
    "Hello World"
  end
end
```

## Testing

```bash
bundle exec rake test
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/toshimaru/rack-simple_user_agent. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
