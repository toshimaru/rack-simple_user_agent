require 'test_helper'

class AndroidTest < BaseTest
  USER_AGENT_STRINGS = {
    android_mobile: {
      "Mozilla/5.0 (Linux; U; Android 4.0.1; ja-jp; Galaxy Nexus Build/ITL41D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30" => {
        from_smartdevice?: true,
        from_smartphone?: true,
        from_ios?: false,
        from_android?: true,
        from_android_mobile?: true,
        from_android_tablet?: false,
        from_windows_phone?: false,
      }
    },
    android_tablet: {
      "Mozilla/5.0 (Linux; Android 5.0; Nexus 9 Build/LRX21R) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Safari/537.36" => {
        from_smartdevice?: true,
        from_smartphone?: false,
        from_ios?: false,
        from_android?: true,
        from_android_mobile?: false,
        from_android_tablet?: true,
        from_windows_phone?: false,
      }
    },
  }.freeze
end
