require 'test_helper'

class WindowsPhoneTest < BaseTest
  USER_AGENT_STRINGS = {
    windows_phone: {
      "Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)" => {
        from_smartphone?: true,
        from_ios?: false,
        from_android?: false,
        from_windows_phone?: true,
      }
    },
  }.freeze
end
