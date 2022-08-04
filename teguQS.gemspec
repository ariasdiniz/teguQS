# frozen_string_literal: true

require_relative "lib/teguQS/version"

Gem::Specification.new do |spec|
  spec.name = "teguQS"
  spec.version = TeguQS::VERSION
  spec.authors = ["Aria Diniz"]
  spec.email = ["aria.diniz.dev@gmail.com"]

  spec.summary = "An experimental message queue system"
  spec.description = "An experimental message queue system inspired on Kafka and using Sinatra for the broker."
  spec.homepage = "https://github.com/ariasdiniz/teguQS"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["documentation_uri"] = "https://rubydoc.info/gems/teguqs"

  spec.add_dependency "sinatra", "2.2"
  spec.add_dependency "singly_linked_queue", "0.1.0"
  spec.add_dependency "json", "2.6"
  spec.add_dependency "puma", "5.6.4"
  spec.add_dependency "net", "0.3.3"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
