module QuickOpenai
  module Gpt3
    def self.gpt3(prompt, **options)
      response = QuickOpenai.client.completions(
        parameters: {
          model: "text-davinci-003",
          prompt: prompt,
          **options
        }
      )

      choices = response["choices"]

      return "" unless choices.any?

      text = choices.dig(0, "text")

      text.chomp.strip
    end
  end
end
