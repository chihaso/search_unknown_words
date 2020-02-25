# frozen_string_literal: true

require "pry"
require_relative "./search"

module MySearch
  class FileIO
    def initialize(input_path)
      @input_path = reject_non_existent_path(input_path)
    end

    def reject_non_existent_path(input_path)
      parsed_path = input_path.rpartition("/")
      target_directory = (parsed_path[0] == "") ? "./" : parsed_path[0]
      filename = parsed_path[2]
      Dir.children(target_directory).include?(filename) ?
        input_path :
        (raise ArgumentError, "入力されたファイルは存在しません")
    end


    def output_path
      suffix = File.extname(@input_path)
      @input_path.delete_suffix(suffix) + "_search" + suffix
    end

    def input_text
      File.open(@input_path) { |file|
        file.read
      }
    end

    def output_text
      MySearch::Search.new(input_text).result
    end

    def output
      File.open(output_path, "w") { |file|
        file.puts(output_text)
      }
    end
  end
end
