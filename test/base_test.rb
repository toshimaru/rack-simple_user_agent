require 'minitest'
require 'rack/test'

class BaseTest < Minitest::Test
  include Rack::Test::Methods

  USER_AGENT_STRINGS = []

  def app
    dummy_app = ->(env) { [200, {}, 'Hello World'] }
    Rack::SimpleUserAgent.new(dummy_app)
  end

  def test_ua_strings
    self.class::USER_AGENT_STRINGS.each do |type, test_criteria|
      test_criteria.each do |user_agent, criteria|
        header "User-Agent", user_agent
        get "/"

        criteria.each do |method, expected_result|
          assert_equal(expected_result, last_request.send(method))
        end
      end
    end
  end
end
