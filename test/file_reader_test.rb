require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_reader'

class FileReaderTest < Minitest::Test
  def setup
    @file_reader = FileReader.new
  end

  def test_it_exists
    assert_instance_of FileReader, @file_reader
  end

  def test_read
    ARGV[0] = 'small_message.txt'
    assert_equal 'Hello world!', @file_reader.read
  end
end
