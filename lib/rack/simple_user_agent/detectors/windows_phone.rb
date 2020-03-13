# frozen_string_literal: true

module Rack
  class SimpleUserAgent
    module Detectors
      module WindowsPhone
        def from_windows_phone?
          user_agent_string.include?('Windows Phone')
        end
      end
    end
  end
end
