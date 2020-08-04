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

  def encode_file_to_english
    braille = @reader.read
    english = encode_to_english(braille)
    @writer.write(english)
    puts message
  end

  def encode_to_english(braille)
    result = []
    if braille.length < 80
      lines = braille.split("").each_slice(braille.length / 3)
      result = lines.reduce([]) do |char_sets, line|
        line.each_slice(2).each_with_index do |char_set, i|
          char_sets[i] = [] if !char_sets[i]
          char_sets[i] << char_set.join('')
        end
        char_sets
      end
    end
    result = result.map do |char_set|
      @dictionary.char_to_braille.invert[char_set]
    end
    result.join('')
  end

  def message
    "Created '#{writer.filename}' containing #{reader.read.length / 6} characters"
  end
end

NightReader.new.encode_file_to_english
