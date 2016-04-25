require "sinatra"
require "pry"
require "rack/simple_user_agent"

configure do
  use Rack::SimpleUserAgent
end

get "/" do
  request.from_smartphone?
  "Hello World!"
end
