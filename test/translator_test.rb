require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/translator'

class TranslatorTest < Minitest::Test
  def setup
    @translator = Translator.new('message.txt', 'braille.txt')
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_message
    assert_equal "Created 'braille.txt' containing 256 characters", @translator.message
  end

  def test_message_output_file_can_be_different
    @translator = Translator.new('message.txt', 'different_name.txt')
    assert_equal "Created 'different_name.txt' containing 256 characters", @translator.message
  end

  def test_message_character_count_can_be_different
    @translator = Translator.new('small_message.txt', 'braille.txt')
    assert_equal "Created 'braille.txt' containing 13 characters", @translator.message
  end

  def test_translate
    assert_equal false, File.exist?('./data/braille.txt')
    @translator.translate
    assert_equal true, File.exist?('./data/braille.txt')
    assert_equal 256, File.open('./data/braille.txt').size

    #teaddown
    File.delete('./data/braille.txt')
  end
end
