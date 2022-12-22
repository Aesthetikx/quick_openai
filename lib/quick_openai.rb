# frozen_string_literal: true

require_relative "quick_openai/version"

module QuickOpenai
  class Error < StandardError; end
end

require "down"
require "ruby/openai"
require "tempfile"

class String
  def gpt3(**options)
    client = OpenAI::Client.new

    response = client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: self,
        **options
      }
    )

    choices = response["choices"]

    return "" unless choices.any?

    text = choices.dig(0, "text")

    text.chomp.strip
  end

  def dalle2(**options)
    client = OpenAI::Client.new

    response = client.images.generate(
      parameters: {
        prompt: self,
        **options
      }
    )

    url = response.dig("data", 0, "url")

    Down.download(url)
  end
end
