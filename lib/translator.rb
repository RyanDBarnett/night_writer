class Translator
  def initialize(input_file, output_file)
    @input = input_file
    @output = output_file
  end

  def message
    "Created '#{@output}' containing 256 characters"
  end
end
