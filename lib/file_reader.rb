class FileReader
  def read
    filename = ARGV[0]
    input_path = "./data/#{filename}"
    File.read(input_path).strip
  end
end
