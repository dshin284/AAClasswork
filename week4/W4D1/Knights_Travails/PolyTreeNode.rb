class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil 
        @children = []
    end

    def parent
        return @parent
    end

    def children
        return @children
    end

    def value
        return @value
    end

    def parent=(parent_obj) #child's new parent = parent_obj
        if @parent #if there is parent, break self from parent
            @parent.children.delete(self) #Delete the children of that parent.
            #This deletes the connection between self and old parent.
        end
        @parent = parent_obj #Set the new child-parent relationship.  
        #Go up to new parent,and add self as another child.
        @parent.children << self if self.parent 
    end
   
    #  NodeA aka parentNode or self
    #   /
    # NodeB

    #NodeA.add_child(NodeB) child_node.parent = self 
    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if self.children.include?(ch3ild_node)
            child_node.parent = nil
            self.children.delete(child_node)
        else
            raise "Child node does not exist"
        end
    end

    
    def dfs(target_value) #node.dfs
        return self if target_value == self.value
        # go through self.children
        self.children.each do |child| #child = node
            results = child.dfs(target_value) #node.dfs
            return results if !results.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = []
        self.children.each do |child|
            queue << child
        end
        return self if target_value == self.value
        while !queue.empty?
            node = queue.shift
            return node if target_value == node.value
            node.children.each {|child| queue << child} 
        end
        return nil
    end
end
