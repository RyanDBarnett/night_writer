require './lib/dictionary'
require './lib/file_reader'
require './lib/file_writer'
require 'pry';

class NightWriter
  attr_reader :reader, :writer

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
    @dictionary = Dictionary.new
  end

  def encode_file_to_braille
    plain = @reader.read.downcase
    braille = encode_to_braille(plain)
    @writer.write(braille)
    puts message
  end

  def encode_to_braille(string)
    char_sets = string_to_braille_char_sets(string)
    braille_char_sets_line_generator(char_sets)
  end

  def string_to_braille_char_sets(string)
    characters = string.split('')
    characters.map do |char|
      @dictionary.char_to_braille[char]
    end
  end

  def braille_char_sets_line_generator(char_sets)
    result = ''
    line_char_sets = char_sets.slice!(0...40)
    while char_sets.length > 0
      result << generate_line(line_char_sets)
      line_char_sets = char_sets.slice!(0...40)
    end
    result
  end

  def generate_line(char_sets)
    line = ''
    (0..2).each do |index|
      line << char_sets.reduce("") do |line, char_set|
        line << char_set[index]
        line
      end + "\n"
    end
    line
  end

  def message
    "Created '#{writer.filename}' containing #{reader.read.length} characters"
  end
end

NightWriter.new.encode_file_to_braille
