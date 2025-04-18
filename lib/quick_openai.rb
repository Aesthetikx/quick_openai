# frozen_string_literal: true

require_relative "quick_openai/version"
require_relative "quick_openai/dalle2"
require_relative "quick_openai/gpt3"
require_relative "quick_openai/extensions/string"

module QuickOpenAI
  class Error < StandardError; end

  class << self
    def client
      OpenAI::Client.new(access_token:)
    end

    def fetch_response_from_client
      ensure_access_token!

      begin
        response = yield client
      rescue StandardError
        raise QuickOpenAI::Error, "Unable to fetch response."
      end

      ensure_no_error!(response)

      response
    end

    private

    def ensure_access_token!
      return if ENV.key?("OPENAI_ACCESS_TOKEN")

      raise QuickOpenAI::Error, "Make sure OPENAI_ACCESS_TOKEN is present in ENV."
    end

    def ensure_no_error!(response)
      return unless (error = response.dig("error", "message"))

      raise QuickOpenAI::Error, "Unable to fetch response: #{error}"
    end

    def access_token
      ENV.fetch("OPENAI_ACCESS_TOKEN")
    end
  end
end

require "down"
require "ruby/openai"
require "tempfile"

class String
  include QuickOpenAI::Extensions::String
end
