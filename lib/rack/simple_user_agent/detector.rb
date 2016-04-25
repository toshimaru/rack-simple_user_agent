module Rack
  class SimpleUserAgent
    module Detector
      def from_smartphone?
        from_ios? || from_android? || from_windows_phone?
      end

      def from_ios?
        from_iphone? || from_ipad? || from_ipod?
      end

      def from_iphone?
        user_agent.to_s.include?("iPhone")
      end

      def from_ipad?
        user_agent.to_s.include?("iPad")
      end

      def from_ipod?
        user_agent.to_s.include?("iPod")
      end

      def from_android?
        user_agent.to_s.include?("Android")
      end

      def from_android_tablet?
        from_android? && !android_mobile?
      end

      def from_android_mobile?
        from_android? && android_mobile?
      end

      def from_windows_phone?
        user_agent.to_s.include?("Windows Phone OS")
      end

      private

      def android_mobile?
        !(user_agent =~ /Android.+Mobi(le)?/).nil?
      end

    end
  end
end
