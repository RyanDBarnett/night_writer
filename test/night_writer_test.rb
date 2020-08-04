require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def setup
    @night_writer = NightWriter.new
  end

  def test_it_exists
    assert_instance_of NightWriter, @night_writer
  end

  def test_can_encode_single_letter_to_braille
    expected =  "0.\n..\n..\n"
    assert_equal expected, @night_writer.encode_to_braille('a')
  end

  def test_string_to_braille_char_sets
    expected =  [
      ["0.", "..", ".."]
    ]

    assert_equal expected, @night_writer.string_to_braille_char_sets('a')

    expected =  [
      ["0.", "..", ".."],
      ["0.", "0.", ".."],
      ["00", "..", ".."]
    ]

    assert_equal expected, @night_writer.string_to_braille_char_sets('abc')
  end

  def test_braille_char_sets_line_generator
    char_sets =  [
      ["0.", "..", ".."]
    ]

    expected =  "0.\n..\n..\n"

    assert_equal expected, @night_writer.braille_char_sets_line_generator(char_sets)

    char_sets =  [
      ["0.", "..", ".."],
      ["0.", "0.", ".."],
      ["00", "..", ".."]
    ]

    expected =  "0.0.00\n..0...\n......\n"

    assert_equal expected, @night_writer.braille_char_sets_line_generator(char_sets)
  end

  def test_message
    file_writer = mock('FileWriter')
    file_writer.stubs(:filename).returns('braille.txt')
    @night_writer.stubs(:writer).returns(file_writer)
    assert_equal "Created 'braille.txt' containing 256 characters", @night_writer.message
  end

  def test_message_output_file_can_be_different
    @translator = Translator.new('message.txt', 'different_name.txt')
    assert_equal "Created 'different_name.txt' containing 256 characters", @translator.message
  end
end
