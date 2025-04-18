# frozen_string_literal: true

module QuickOpenAI
  module Extensions
    module String
      def gpt3(**)
        QuickOpenAI::Gpt3.gpt3(self, **)
      end

      def dalle2(**)
        QuickOpenAI::Dalle2.dalle2(self, **)
      end
    end
  end
end
