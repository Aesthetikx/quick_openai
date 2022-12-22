# frozen_string_literal: true

module QuickOpenAI
  module Gpt3
    def self.gpt3(prompt, **options)
      parameters = {
        model: "text-davinci-003",
        max_tokens: 2048,
        prompt: prompt,
        **options
      }

      response = QuickOpenAI.fetch_response_from_client do |client|
        client.completions(parameters: parameters)
      end

      text = response.dig("choices", 0, "text")

      raise QuickOpenAI::Error, "Unable to parse response." if text.nil? || text.empty?

      text.chomp.strip
    end
  end
end
