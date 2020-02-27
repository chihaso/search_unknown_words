# frozen_string_literal: true

require "pry"
require "minitest/autorun"
require "json"
require_relative "../lib/file_io"
require_relative "../lib/search"
require_relative "../lib/parse_text"

class SearchUnknownWordsTest < Minitest::Test
  def setup
    File.exist?("sample.txt") ? File.delete("sample.txt") : nil
    File.exist?("sample_search.txt") ? File.delete("sample_search.txt") : nil
    File.exist?("../../far_sample.txt") ? File.delete("../../far_sample.txt") : nil
    @test_text =
      <<~End
        1行目_ これは テスト
        2行目_ ほんとうに テスト？  test?
        3行目_ テスト だってば
        4行目_ really?
        5行目_ 英語?
        6行目_ ?
      End
    IO.write("sample.txt", @test_text)
    IO.write("../../far_sample.txt", "search_unknown_wordsのテスト用サンプルファイル")
    @fileio = MySearch::FileIO.new("sample.txt")
  end

  def test_引数の入力パス名と拡張子の間に_searchを挿入する
    assert_equal("sample_search.txt", @fileio.output_path)
  end

  def test_カレントディレクトリ以外のパスを入力すると_searchを挿入する
    far_sample = MySearch::FileIO.new("../../far_sample.txt")
    assert_equal("../../far_sample_search.txt", far_sample.output_path)
  end

  def test_入力された文章から検索ワードを抽出する # ? ？のついた語
    parse = MySearch::ParseText.new(@test_text)
    unknown_words = parse.extract_unknown_words
    assert_equal(["テスト", "test", "really", "英語"], unknown_words)
  end

  def test_抽出された単語でgoogle検索した結果がJSONで返る
    search_result = MySearch::Search.new(@test_text).search
    assert_equal(search_result.class, JSON)
  end

  # def test_存在しないファイルを渡された場合はエラーを返す
  #   fileio = MySearch::FileIO.new()
  #   assert()
  # end

  def test_入力されたファイル名に_searchをつけた新しいファイルを出力する
    @fileio.output
    assert(Dir.children(".").include?("sample_search.txt"))
  end
end
