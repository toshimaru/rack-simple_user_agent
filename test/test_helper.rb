$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'coveralls'
Coveralls.wear!

require 'rack/simple_user_agent'
require 'minitest/autorun'
