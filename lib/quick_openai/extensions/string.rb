# frozen_string_literal: true

module QuickOpenAI
  module Extensions
    module String
      def gpt3(**options)
        QuickOpenAI::Gpt3.gpt3(self, **options)
      end

      def dalle2(**options)
        QuickOpenAI::Dalle2.dalle2(self, **options)
      end
    end
  end
end
