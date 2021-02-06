class PolyTreeNode

    attr_reader :children, :value, :parent

    def initialize(value=nil)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        if !self.parent.nil? 
            array = self.parent.children
            array.delete(self)
        end

        if !parent.nil?
            parent.children << self if !parent.children.include?(self)
            @parent = parent
        else 
          @parent = nil
        end

        @parent
    end

    # object_name.class
    # 1.class = Int
    # string 


    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        raise 'error' if !children.include?(child)
        child.parent = nil
    end


    def dfs(target)
        return self if self.value == target
        children.each do |kid|
          var = kid.dfs(target)
          if !var.nil?
            return var
          end
        end

        nil
    end

    def bfs(target)
      queue = [self]

      while queue.length != 0
        first = queue.shift
        if first.value == target
            return first
        else
           first.children.each do |child|
             queue << child
           end
        end
      end
      nil
    end

end