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

  def test_attributes
    assert_equal '', @file_writer.filename
    assert_equal '', @file_writer.path

    require 'pry'; binding.pry
    @file_writer.stubs(:filename).returns('braille.txt')
    content = 'Test'
    @file_writer.write(content)

    assert_equal 'braille.txt', @file_writer.filename
    assert_equal "./data/braille.txt", @file_writer.path

    #teardown
    File.delete('./data/braille.txt')
  end

  def test_write
    @file_writer.stubs(:filename).returns('braille.txt')
    content = 'Test'
    @file_writer.write(content)
    assert_equal true, File.exist?('./data/braille.txt')
    assert_equal 'Test', File.read('./data/braille.txt')

    #teardown
    File.delete('./data/braille.txt')
  end
end
