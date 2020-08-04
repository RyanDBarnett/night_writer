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

  def test_attributes
    assert_equal '', @file_reader.filename
    assert_equal '', @file_reader.path
    mock
    @file_reader.stubs(:ARGV).returns(['small_message.txt'])
    @file_reader.read

    assert_equal 'small_message.txt', @file_reader.filename
    assert_equal "./data/small_message.txt", @file_reader.path
  end

  def test_read
    ARGV[0] = 'small_message.txt'
    assert_equal 'hello world!', @file_reader.read
  end
end
