module Rack
  class SimpleUserAgent
    module Detectors
      module Helper

        private

        def user_agent_string
          user_agent.to_s
        end
      end
    end
  end
end
