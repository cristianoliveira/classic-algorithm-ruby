module Balanced
  class QuickUnion
    attr_reader :elements
    START_VALUE = 1

    def initialize(elements_lenght)
      @elements = elements_lenght.times.map{|i| i}
      @tree_size = Hash.new(START_VALUE)
    end

    def union(number, target)
      return connect(smallest_to_greatest_tree(root(number), root(target)))
    end

    def connected?(number, target)
      root(number) == root(target)
    end

    private
    def smallest_to_greatest_tree(root, root_target)
      return [root, root_target] if @tree_size[root] < @tree_size[root_target]
      return [root_target, root]
    end

    def root(element)
      return element if root?(element)
      root(@elements[element])
    end

    def root?(element)
      @elements[element] == element
    end

    def connect(elements)
      child, parent = elements[0], elements[1]
      @elements[child] = parent
      @tree_size[parent] += @tree_size[child] if @tree_size[child] == @tree_size[parent]
      return self
    end
  end
end
