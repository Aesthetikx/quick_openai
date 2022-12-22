module QuickOpenai
  module Extensions
    module String
      def gpt3(**options)
        QuickOpenai::Gpt3.gpt3(self, **options)
      end

      def dalle2(**options)
        client = OpenAI::Client.new

        response = client.images.generate(
          parameters: {
            prompt: self,
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
end
