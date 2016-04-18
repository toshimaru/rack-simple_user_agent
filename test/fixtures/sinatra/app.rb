require "sinatra"
require "pry"
require "rack/simple_user_agent"

configure do
  use Rack::SimpleUserAgent
end

get "/" do
  binding.pry
  "Hello World!"
end
