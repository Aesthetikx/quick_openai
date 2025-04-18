# frozen_string_literal: true

require_relative "lib/quick_openai/version"

Gem::Specification.new do |spec|
  spec.name = "quick_openai"
  spec.version = QuickOpenAI::VERSION
  spec.authors = ["John DeSilva"]
  spec.email = ["desilvjo@umich.edu"]

  spec.summary = "Convenience extensions for using OpenAI with Ruby"
  spec.description = "Provides monkey patches for quick usage of GPT3 and DALLE2"
  spec.homepage = "https://github.com/Aesthetikx/quick_openai"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2"

  spec.metadata["rubygems_mfa_required"] = "true"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Aesthetikx/quick_openai"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci|github)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "down", "~> 5"
  spec.add_dependency "ruby-openai", "~> 8"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
