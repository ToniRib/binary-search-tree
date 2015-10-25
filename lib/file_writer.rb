# Class for writing a file of the sorted nodes of a binary search tree
class FileWriter
  def write(sorted_data)
    filename = ARGV[1]

    outfile = File.open(filename, 'w')
    sorted_data.length.times do |i|
      outfile.write(sorted_data.shift.to_s << "\n")
    end
    
    outfile.close
  end
end
