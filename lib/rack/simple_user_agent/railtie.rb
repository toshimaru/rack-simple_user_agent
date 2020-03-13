# frozen_string_literal: true

module Rack
  class SimpleUserAgent
    class Railtie < ::Rails::Railtie
      initializer 'rack-simple_user_agent.configure_rails_initialization' do |app|
        app.config.middleware.use Rack::SimpleUserAgent

        ActiveSupport.on_load(:action_controller) do
          ActionDispatch::Request.class_eval do
            include Rack::SimpleUserAgent::Detectors
          end
        end
      end
    end
  end
end
