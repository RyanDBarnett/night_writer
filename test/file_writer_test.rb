require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_writer'

class FileWriterTest < Minitest::Test
  def setup
    @file_writer = FileWriter.new
  end

  def test_it_exists
    assert_instance_of FileWriter, @file_writer
  end

  def test_write
    ARGV[1] = 'braille.txt'
    content = 'Test'
    @file_writer.write(content)
    assert_equal true, File.exists?('./data/braille.txt')
    assert_equal 'Test', File.read('./data/braille.txt')

    #teardown
    File.delete('./data/braille.txt')
  end
end
