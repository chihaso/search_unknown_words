# frozen_string_literal: true

require "pry"
require "net/http"
require "uri"
require_relative "parse_text"
require_relative "../key"

module MySearch
  class Search
    def initialize(input_text)
      @input_text = input_text
    end

    def unknown_words
      MySearch::ParseText.new(@input_text).extract_unknown_words
    end

    def urls
      urls = []
      unknown_words.each() { |word|
        urls << "https://www.googleapis.com/customsearch/v1?&q=#{word}&hl=ja&num=3&key=#{API_key}&cx=#{cx_key}"
      }
      urls
    end

    def search
      output = []
      urls.each { |url|
        output << Net::HTTP.get_print(URI.parse(url))
      }
      output
    end

    def result
    end
  end
end
