require './lib/dictionary'
require './lib/file_reader'
require './lib/file_writer'
require 'pry'

class NightReader
  attr_reader :reader, :writer

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
    @dictionary = Dictionary.new
  end

  def decode_file_to_english
    braille = @reader.read
    english = decode_to_english(braille)
    @writer.write(english)
    puts message
  end

  def decode_to_english(braille)
    char_sets = braille_to_char_sets(braille)
    braille_char_sets_to_string(char_sets)
  end

  def braille_to_char_sets(braille)
    char_sets = []
    while braille.length > 0 do
      line = braille.slice!(0...80)
      braille_lines = line.split("").each_slice(line.length / 3)
      braille_char_sets = braille_lines.reduce([]) do |char_sets, line|
        line.each_slice(2).each_with_index do |char_set, i|
          char_sets[i] = [] if !char_sets[i]
          char_sets[i] << char_set.join('')
        end
        char_sets
      end
      char_sets.concat(braille_char_sets)
    end
    char_sets
  end

  def braille_char_sets_to_string(char_sets)
    char_sets.map do |char_set|
      @dictionary.char_to_braille.invert[char_set]
    end.join('')
  end

  def message
    "Created '#{writer.filename}' containing #{reader.read.length / 6} characters"
  end
end

NightReader.new.decode_file_to_english
