class Node
  attr_accessor :left, :right
  attr_reader :data

  def initialize(data)
    @data = data
  end

  # will need to refactor
  def push(node)
    if node.data < data
      if left.nil?
        @left = node
      else
        left.push(node)
      end
    else
      if right.nil?
        @right = node
      else
        right.push(node)
      end
    end
  end
end
