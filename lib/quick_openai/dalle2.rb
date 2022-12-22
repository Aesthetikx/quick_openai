module QuickOpenai
  module Dalle2
    def self.dalle2(prompt, **options)
      client = OpenAI::Client.new

      response = client.images.generate(
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
