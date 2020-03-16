# frozen_string_literal: true

require 'minitest'
require 'rack/test'

class BaseTest < Minitest::Test
  include Rack::Test::Methods

  USER_AGENT_STRINGS = [].freeze

  def app
    dummy_app = ->(_env) { [200, {}, 'Hello World'] }
    Rack::SimpleUserAgent.new(dummy_app)
  end

  def test_ua_strings
    self.class::USER_AGENT_STRINGS.each do |type, test_criteria|
      test_criteria.each do |user_agent, criteria|
        header 'User-Agent', user_agent
        get '/'

        criteria.each do |method, expected_result|
          assert_equal(expected_result, last_request.public_send(method), "#{type}.#{method} should be #{expected_result}")
        end
      end
    end
  end
end
