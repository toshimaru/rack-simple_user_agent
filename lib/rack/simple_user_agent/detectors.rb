require "rack/simple_user_agent/detectors/helper"
require "rack/simple_user_agent/detectors/smartphone"

module Rack
  class SimpleUserAgent
    module Detectors
      include Helper
      include Smartphone
    end
  end
end
