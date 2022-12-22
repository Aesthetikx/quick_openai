# frozen_string_literal: true

module QuickOpenAI
  module Dalle2
    def self.dalle2(prompt, **options)
      response = QuickOpenAI.client.images.generate(
        parameters: {
          prompt: prompt,
          **options
        }
      )

      results = response["data"]

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
