class FileReader
  attr_reader :path
  def initialize
    @path = ""
  end

  def read
    @path = "./data/#{filename}"
    if File.exist? @path
      File.read(@path).gsub("\n", "")
    else
      ""
    end
  end

  def filename
    ARGV[0]
  end
end
