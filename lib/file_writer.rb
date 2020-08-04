class FileWriter
  def write data
    filename = ARGV[1]
    output_path = "./data/#{filename}"
    File.write(output_path, data)
  end
end
