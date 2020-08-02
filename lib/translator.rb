class Translator
  def initialize(input_file, output_file)
    @input = input_file
    @output = output_file
    @input_path = "./data/#{input_file}"
    @output_path = "./data/#{output_file}"
  end

  def message
    "Created '#{@output}' containing #{File.open(@input_path).size} characters"
  end
end
