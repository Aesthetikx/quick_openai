# frozen_string_literal: true

require "quick_openai"

require "dotenv"

require "vcr"

Dotenv.load(".env.test")

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!

  if ENV.key?('OPENAI_ACCESS_TOKEN')
    config.filter_sensitive_data('<OPENAI_ACCESS_TOKEN>') do
      ENV.fetch('OPENAI_ACCESS_TOKEN')
    end
  end
end
