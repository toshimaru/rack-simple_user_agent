# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'coveralls'
Coveralls.wear!
require 'minitest/reporters'
Minitest::Reporters.use!

require 'pry'
require 'rack/simple_user_agent'
require 'base_test'
require 'minitest/autorun'
