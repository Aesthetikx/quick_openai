# frozen_string_literal: true

module QuickOpenAI
  module Dalle2
    def self.dalle2(prompt, **options)
      parameters = {
        prompt: prompt,
        **options
      }

      response = QuickOpenAI.fetch_response_from_client do |client|
        client.images.generate(parameters: parameters)
      end

      results = response.fetch("data")

      tempfiles = results.map do |result|
        url = result["url"]

        Down.download(url)
      end

      if tempfiles.size == 1
        tempfiles.first
      else
        tempfiles
      end
    end
  end
end
