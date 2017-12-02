Gem::Specification.new do |s|
  s.name          = "codepanda"
  s.version       = "0.0.1"
  s.authors       = ["Panda"]
  s.email         = "netwix+panda@gmail.com"
  s.homepage      = ""
  s.summary       = "Simple gRPC client server code execution"
  s.description   = "Simple project which aims to execute any arbitrary code in safe env"

  s.files         = `git ls-files -- lib/* scripts/*`.split("\n")
  s.require_paths = ["lib"]
  s.platform      = Gem::Platform::RUBY

  s.add_dependency "grpc", "~> 1.0"

  s.add_development_dependency "bundler", "~> 1.7"
  s.add_development_dependency "grpc-tools", "~> 1.7"
  s.add_development_dependency "rspec", "~> 3.7"
  s.add_development_dependency "rubocop", "~> 0.51"
  s.add_development_dependency "rubocop-rspec", "~> 1.20"
end
