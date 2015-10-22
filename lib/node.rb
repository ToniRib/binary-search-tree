class Node
  attr_accessor :left, :right
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def push(node)
    if node.data < data
      @left = node
    else
      @right = node
    end
  end
end
