class FileReader
  attr_reader :path
  def initialize
    @path = ""
  end

  def read
    @path = "./data/#{filename}"
    return File.read(@path).strip
  end

  def filename
    ARGV[0]
  end
end
