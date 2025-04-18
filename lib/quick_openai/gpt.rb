# frozen_string_literal: true

module QuickOpenAI
  module Gpt
    class << self
      def gpt3(prompt, **)
        model = "gpt-3.5-turbo"

        generic_gpt(prompt, model:, **)
      end

      def gpt4(prompt, **)
        model = "gpt-4.1"

        generic_gpt(prompt, model:, **)
      end

      alias gpt gpt4

      private

      def generic_gpt(prompt, **options)
        parameters = {
          max_tokens: 2048,
          messages: [{ role: "user", content: prompt }],
          **options
        }

        response = QuickOpenAI.fetch_response_from_client do |client|
          client.chat(parameters:)
        end

        text = response.dig("choices", 0, "message", "content")

        raise QuickOpenAI::Error, "Unable to parse response." if text.nil? || text.empty?

        text.chomp.strip
      end
    end
  end
end
