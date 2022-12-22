# frozen_string_literal: true

module QuickOpenAI
  module Gpt3
    def self.gpt3(prompt, **options)
      response = QuickOpenAI.client.completions(
        parameters: {
          model: "text-davinci-003",
          max_tokens: 2048,
          prompt: prompt,
          **options
        }
      )

      text = response.dig("choices", 0, "text")

      if text.nil? || text.empty?
        raise QuickOpenAI::Error, "Unable to parse response."
      end

      text.chomp.strip
    rescue StandardError
      raise QuickOpenAI::Error, "Unable to fetch response."
    end
  end
end
