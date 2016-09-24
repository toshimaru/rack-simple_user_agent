module Rack
  class SimpleUserAgent
    module Detectors
      module Ios
        def from_ios?
          from_iphone? || from_ipad? || from_ipod?
        end

        def from_iphone?
          user_agent_string.include?("iPhone")
        end

        def from_ipad?
          user_agent_string.include?("iPad")
        end

        def from_ipod?
          user_agent_string.include?("iPod")
        end
      end
    end
  end
end
