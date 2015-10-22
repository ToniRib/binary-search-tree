class Node
  attr_accessor :left, :right
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def push(node)
    if node.data < data
      if @left.nil?
        @left = node
      else
        left.push(node)
      end
    else
      @right = node
    end
  end
end
