# frozen_string_literal: true

require "pry"

module MySearch
  class ParseText
    def initialize(text)
      @text = text
    end

    def extract_unknown_words
      @unknown_words = @text.split(/\s/).select { |word|
        word.include?("?") || word.include?("？")
      }.map { |with_question|
        with_question.delete("?？")
      }.select { |unknown_word| unknown_word != "" }
    end
  end
end
