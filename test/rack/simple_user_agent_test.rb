require 'test_helper'
require 'rack/test'

class Rack::SimpleUserAgentTest < Minitest::Test
  include Rack::Test::Methods

  USER_AGENT_STRINGS = {
    iphone: "Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A403 Safari/8536.25",
    android: "Mozilla/5.0 (Linux; U; Android 4.0.1; ja-jp; Galaxy Nexus Build/ITL41D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30",
    android_mobile: "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.23 Mobile Safari/537.36",
    android_tablet: "Mozilla/5.0 (Linux; Android 5.0; Nexus 9 Build/LRX21R) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Safari/537.36",
    windows_phone: "Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)",
  }

  def app
    dummy_app = ->(env) { [200, {}, 'Hello World'] }
    Rack::SimpleUserAgent.new(dummy_app)
  end

  # iPhone

  def test_iphone_is_smartphone
    header "User-Agent", USER_AGENT_STRINGS[:iphone]
    get "/"
    assert last_request.from_smartphone?
    assert last_request.from_iphone?
    refute last_request.from_android?
  end

  # Android

  def test_android_is_smartphone
    header "User-Agent", USER_AGENT_STRINGS[:android]
    get "/"
    assert last_request.from_smartphone?
  end

  # Android Mobile

  def test_from_android_mobile
    header "User-Agent", USER_AGENT_STRINGS[:android_mobile]
    get "/"
    assert last_request.from_smartphone?
    refute last_request.from_iphone?
    assert last_request.from_android?
    assert last_request.from_android_mobile?
    refute last_request.from_android_tablet?
  end

  # Android Tablet

  def test_from_android_tablet
    header "User-Agent", USER_AGENT_STRINGS[:android_tablet]
    get "/"
    assert last_request.from_smartphone?
    refute last_request.from_iphone?
    assert last_request.from_android?
    refute last_request.from_android_mobile?
    assert last_request.from_android_tablet?
  end

  # Windows Phone

  def test_from_android_tablet
    header "User-Agent", USER_AGENT_STRINGS[:windows_phone]
    get "/"
    assert last_request.from_smartphone?
    refute last_request.from_iphone?
    refute last_request.from_android?
    refute last_request.from_android_mobile?
    refute last_request.from_android_tablet?
    assert last_request.from_windows_phone?
  end
end
