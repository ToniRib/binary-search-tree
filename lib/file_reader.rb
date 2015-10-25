# Class for reading in a file to the Tree class
class FileReader
  def read(binary_search_tree)
    filename = ARGV[0]

    File.open(filename).each_line do |line|
      data = convert(line.chomp)
      begin
        binary_search_tree.insert(data)
      rescue
        puts "Cannot add #{data} to tree: incorrect data type."
      end
    end
  end

  def convert(line)
    if line.include?('.') && number?(line)
      line.to_f
    elsif number?(line)
      line.to_i
    else
      line
    end
  end

  def number?(string)
    !(string.to_f.zero? && string.to_i.zero?)
  end
end
