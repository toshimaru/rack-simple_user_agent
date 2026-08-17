# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'simplecov'
require 'simplecov_json_formatter'
SimpleCov.start do
  formatter SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::JSONFormatter,
      SimpleCov::Formatter::HTMLFormatter
    ]
  )
  add_filter '/test/'
end
require 'minitest/reporters'
Minitest::Reporters.use!

require 'rack/simple_user_agent'
require 'base_test'
require 'minitest/autorun'
