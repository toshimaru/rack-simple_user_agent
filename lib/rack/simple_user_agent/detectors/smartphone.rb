module Rack
  class SimpleUserAgent
    module Detectors
      module Smartphone
        def from_smartdevice?
          from_ios? || from_android? || from_windows_phone?
        end

        def from_smartphone?
          from_iphone? || from_android_mobile? || from_windows_phone?
        end

        def from_tablet?
          from_ipad? || from_android_tablet?
        end

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

        def from_android?
          user_agent_string.include?("Android")
        end

        def from_android_tablet?
          from_android? && !android_mobile?
        end

        def from_android_mobile?
          from_android? && android_mobile?
        end

        def from_windows_phone?
          user_agent_string.include?("Windows Phone")
        end

        private

        def android_mobile?
          !(user_agent =~ /Android.+Mobi(le)?/).nil?
        end
      end
    end
  end
end
