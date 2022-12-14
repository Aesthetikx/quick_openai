# frozen_string_literal: true

require_relative "quick_openai/version"

module QuickOpenai
  class Error < StandardError; end
  # Your code goes here...
end

require "ruby/openai"
require "tempfile"

class String
  def gpt3
    client = OpenAI::Client.new

    response = client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: self
      }
    )

    choices = response["choices"]

    return "" unless choices.any?

    text = choices.dig(0, "text")

    text.chomp.strip
  end

  def dalle2
    ::Tempfile.new
  end
end
