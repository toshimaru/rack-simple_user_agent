require "sinatra"
require "pry"
require "rack/simple_user_agent"

configure do
  use Rack::SimpleUserAgent
end

get "/" do
  if request.from_smartphone?
    "Hello World from smartphone"
  elsif request.from_tablet?
    "Hello World from tablet"
  else
    "Hello World"
  end
end
