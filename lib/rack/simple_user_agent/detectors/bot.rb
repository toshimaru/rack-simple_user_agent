# frozen_string_literal: true

module Rack
  class SimpleUserAgent
    module Detectors
      module Bot
        def from_googlebot?
          user_agent_string.include?('Googlebot')
        end

        def from_googlebot_news?
          user_agent_string.include?('Googlebot-News')
        end

        def from_googlebot_images?
          user_agent_string.include?('Googlebot-Image')
        end

        def from_googlebot_video?
          user_agent_string.include?('Googlebot-Video')
        end
      end
    end
  end
end
