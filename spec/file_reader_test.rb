require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_reader'

class FileReaderTest < Minitest::Test
  def setup
    @fr = FileReader.new
  end

  def test_recognizes_integer_string_as_number
    assert @fr.number?('1')
  end

  def test_recognizes_float_string_as_number
    assert @fr.number?('2.2')
  end

  def test_refutes_non_number_string_as_number
    refute @fr.number?('abc')
  end

  def test_converts_float_string_to_float
    assert_equal 2.2, @fr.convert('2.2')
  end

  def test_converts_integer_string_to_integer
    assert_equal 3, @fr.convert('3')
  end

  def test_leaves_non_numeric_string_as_string
    assert_equal 'hello', @fr.convert('hello')
  end
end
