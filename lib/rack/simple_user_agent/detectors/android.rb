module Rack
  class SimpleUserAgent
    module Detectors
      module Android
        def from_android?
          user_agent_string.include?("Android")
        end

        def from_android_tablet?
          from_android? && !android_mobile?
        end

        def from_android_mobile?
          from_android? && android_mobile?
        end

        private

        def android_mobile?
          !(user_agent =~ /Android.+Mobi(le)?/).nil?
        end
      end
    end
  end
end
