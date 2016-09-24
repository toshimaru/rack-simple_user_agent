require 'test_helper'

class Rack::SimpleUserAgentTest < BaseTest
  SMARTPHONE_USER_AGENT_STRINGS = {
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
    android_mobile: {
      "Mozilla/5.0 (Linux; U; Android 4.0.1; ja-jp; Galaxy Nexus Build/ITL41D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30" => {
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
        from_smartphone?: false,
        from_ios?: false,
        from_android?: true,
        from_android_mobile?: false,
        from_android_tablet?: true,
        from_windows_phone?: false,
      }
    },
    windows_phone: {
      "Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)" => {
        from_smartphone?: true,
        from_ios?: false,
        from_android?: false,
        from_windows_phone?: true,
      }
    },
  }.freeze

  BOT_USER_AGENT_STRINGS = {
    googlebot_news: {
      "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" => {
        from_googlebot?: true,
        from_googlebot_news?: false,
        from_googlebot_images?: false,
        from_googlebot_video?: false,
      }
    },
    googlebot_news: {
      "Googlebot-News" => {
        from_googlebot?: true,
        from_googlebot_news?: true,
        from_googlebot_images?: false,
        from_googlebot_video?: false,
      }
    },
    googlebot_images: {
      "Googlebot-Image/1.0" => {
        from_googlebot?: true,
        from_googlebot_news?: false,
        from_googlebot_images?: true,
        from_googlebot_video?: false,
      }
    },
    googlebot_video: {
      "Googlebot-Video/1.0" => {
        from_googlebot?: true,
        from_googlebot_news?: false,
        from_googlebot_images?: false,
        from_googlebot_video?: true,
      }
    },
  }.freeze

  def test_smartphone
    SMARTPHONE_USER_AGENT_STRINGS.each do |type, test_criteria|
      test_criteria.each do |user_agent, criteria|
        header "User-Agent", user_agent
        get "/"

        criteria.each do |method, expected_result|
          assert_equal(last_request.send(method), expected_result)
        end
      end
    end
  end

  def test_bot
    BOT_USER_AGENT_STRINGS.each do |type, test_criteria|
      test_criteria.each do |user_agent, criteria|
        header "User-Agent", user_agent
        get "/"

        criteria.each do |method, expected_result|
          assert_equal(last_request.send(method), expected_result)
        end
      end
    end
  end
end
