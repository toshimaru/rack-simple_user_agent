require "rack/simple_user_agent/version"
require "rack/simple_user_agent/detectors"
require 'rack/simple_user_agent/railtie' if defined?(Rails)

module Rack
  class SimpleUserAgent
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env)
    end
  end

  class Request
    include Rack::SimpleUserAgent::Detectors
  end
end
