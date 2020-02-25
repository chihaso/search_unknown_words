# frozen_string_literal: true

require_relative "./lib/file_io"

input_path = ARGV[0] ? ARGV[0] : "no-args"
search = MySearch::SearchUnknownWords.new(input_path)
search.output
