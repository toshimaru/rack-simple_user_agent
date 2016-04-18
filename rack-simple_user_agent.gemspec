lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/simple_user_agent/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-simple_user_agent"
  spec.version       = Rack::SimpleUserAgent::VERSION
  spec.authors       = ["toshimaru"]
  spec.email         = ["me@toshimaru.net"]

  spec.summary       = %q{Rack::SimpleUserAgent is stupidly simple UA detector}
  spec.description   = %q{Rack::SimpleUserAgent is stupidly simple UA detector mainly for smartphones.}
  spec.homepage      = "https://github.com/toshimaru/rack-simple_user_agent"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rack-test"
end
