require 'test_helper'

class IosTest < BaseTest
  USER_AGENT_STRINGS = {
    iphone: {
      "Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A403 Safari/8536.25" => {
        from_smartphone?: true,
        from_ios?: true,
        from_iphone?: true,
        from_ipad?: false,
        from_ipod?: false,
        from_android?: false,
        from_windows_phone?: false,
      }
    },
    ipad: {
      "Mozilla/5.0 (iPad; CPU OS 8_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12D508 Safari/600.1.4" => {
        from_smartphone?: false,
        from_ios?: true,
        from_iphone?: false,
        from_ipad?: true,
        from_ipod?: false,
        from_android?: false,
        from_android_tablet?: false,
        from_windows_phone?: false,
      }
    },
  }.freeze
end
