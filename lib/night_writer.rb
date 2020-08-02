require './lib/translator'

translator = Translator.new(ARGV[0], ARGV[1])

puts translator.message
