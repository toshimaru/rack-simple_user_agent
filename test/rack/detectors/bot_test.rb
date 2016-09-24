require 'test_helper'

class BotTest < BaseTest
  USER_AGENT_STRINGS = {
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
end
