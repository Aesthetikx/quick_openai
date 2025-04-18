# frozen_string_literal: true

module QuickOpenAI
  module Extensions
    module String
      def gpt(**) = QuickOpenAI::Gpt.gpt(self, **)

      def gpt3(**) = QuickOpenAI::Gpt.gpt3(self, **)

      def gpt4(**) = QuickOpenAI::Gpt.gpt4(self, **)

      def dalle(**) = QuickOpenAI::Dalle.dalle(self, **)

      def dalle2(**) = QuickOpenAI::Dalle.dalle2(self, **)

      def dalle3(**) = QuickOpenAI::Dalle.dalle3(self, **)
    end
  end
end
