require "rack/simple_user_agent/detectors/android"
require "rack/simple_user_agent/detectors/bot"
require "rack/simple_user_agent/detectors/ios"
require "rack/simple_user_agent/detectors/windows_phone"

module Rack
  class SimpleUserAgent
    module Detectors
      include Android
      include Bot
      include Ios
      include WindowsPhone

      def from_smartdevice?
        from_ios? || from_android? || from_windows_phone?
      end

      def from_smartphone?
        from_iphone? || from_ipod? || from_android_mobile? || from_windows_phone?
      end

      def from_tablet?
        from_ipad? || from_android_tablet?
      end

      private

      def user_agent_string
        user_agent.to_s
      end
    end
  end
end
