# frozen_string_literal: true

require_relative "quick_openai/version"
require_relative "quick_openai/dalle2"
require_relative "quick_openai/gpt3"
require_relative "quick_openai/extensions/string"

module QuickOpenAI
  class Error < StandardError; end

  def self.client
    OpenAI::Client.new
  end

  def self.fetch_response_from_client
    begin
      response = yield client
    rescue StandardError
      raise QuickOpenAI::Error, "Unable to fetch response."
    end

    if (error = response.dig("error", "message"))
      raise QuickOpenAI::Error, "Unable to fetch response: #{error}"
    end

    response
  end
end

require "down"
require "ruby/openai"
require "tempfile"

class String
  include QuickOpenAI::Extensions::String
end
