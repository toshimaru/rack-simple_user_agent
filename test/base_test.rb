require 'minitest'
require 'rack/test'

class BaseTest < Minitest::Test
  include Rack::Test::Methods

  def app
    dummy_app = ->(env) { [200, {}, 'Hello World'] }
    Rack::SimpleUserAgent.new(dummy_app)
  end
end
