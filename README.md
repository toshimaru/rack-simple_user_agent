# Rack::SimpleUserAgent

[![Gem Version](https://badge.fury.io/rb/rack-simple_user_agent.svg)](https://badge.fury.io/rb/rack-simple_user_agent)
[![Build Status](https://travis-ci.org/toshimaru/rack-simple_user_agent.svg)](https://travis-ci.org/toshimaru/rack-simple_user_agent)
[![Coverage Status](https://coveralls.io/repos/github/toshimaru/rack-simple_user_agent/badge.svg)](https://coveralls.io/github/toshimaru/rack-simple_user_agent)
[![Code Climate](https://codeclimate.com/github/toshimaru/rack-simple_user_agent/badges/gpa.svg)](https://codeclimate.com/github/toshimaru/rack-simple_user_agent)

Rack::SimpleUserAgent is Rack::Request extension which detects  smartphone from user-agent string. There is no complicated logic for the detection, it simply checks if user-agent includes particular string.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-simple_user_agent'
```

## Usage

### on Rails

Bundling 'rack-simple_user_agent' automatically makes Rack::SimpleUserAgent methods available. It's convenient when you use the feature [Action Pack Variants](http://guides.rubyonrails.org/4_1_release_notes.html#action-pack-variants) (as of Rails4.1).

- `request.from_smartphone?`
- `request.from_android?`
- `request.from_iphone?`
- `request.from_windows_phone?`

### on Sinatra

```rb
require "sinatra"
require "rack/simple_user_agent"

configure do
  use Rack::SimpleUserAgent
end

get "/" do
  request.from_smartphone?
  "Hello World!"
end
```

## Available Detection Methods

```
request ── from_smartphone?
           ├── from_android?
           │   ├── from_android_mobile?
           │   └── from_android_tablet?
           ├── from_iphone?
           │   ├── from_ipad?
           │   ├── from_iphone?
           │   └── from_ipod?
           └── from_windows_phone?
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/toshimaru/rack-simple_user_agent. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
