# frozen_string_literal: true

require_relative "quick_openai/version"

module QuickOpenai
  class Error < StandardError; end
  # Your code goes here...
end

require 'tempfile'

class String
  def gpt3
    "4"
  end

  def dalle2
    ::Tempfile.new
  end
end
