# frozen_string_literal: true

module QuickOpenAI
  module Dalle
    class << self
      def dalle2(prompt, **)
        generic_dalle(prompt, **)
      end

      def dalle3(prompt, **)
        default_size = "1024x1024"

        generic_dalle(prompt, size: default_size, **)
      end

      alias dalle dalle3

      private

      def generic_dalle(prompt, **options)
        parameters = {
          prompt:,
          **options
        }

        response = QuickOpenAI.fetch_response_from_client do |client|
          client.images.generate(parameters:)
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
end
