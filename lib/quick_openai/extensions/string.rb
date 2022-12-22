module QuickOpenai
  module Extensions
    module String
      def gpt3(**options)
        QuickOpenai::Gpt3.gpt3(self, **options)
      end

      def dalle2(**options)
        QuickOpenai::Dalle2.dalle2(self, **options)
      end
    end
  end
end
