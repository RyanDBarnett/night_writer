class FileWriter
  attr_reader :path
  def initialize
    @path = ""
  end

  def write data
    @path = "./data/#{filename}"
    File.write(@path, data)
  end

  def filename
    ARGV[1]
  end
end
