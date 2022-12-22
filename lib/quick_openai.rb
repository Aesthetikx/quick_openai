# frozen_string_literal: true

require_relative "quick_openai/version"
require_relative "quick_openai/extensions/string"

module QuickOpenai
  class Error < StandardError; end
end

require "down"
require "ruby/openai"
require "tempfile"

class String
  include QuickOpenai::Extensions::String
end
