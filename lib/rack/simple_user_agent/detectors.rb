require "rack/simple_user_agent/detectors/bot"
require "rack/simple_user_agent/detectors/smartphone"

module Rack
  class SimpleUserAgent
    module Detectors
      include Bot
      include Smartphone

      private

      def user_agent_string
        user_agent.to_s
      end
    end
  end
end
