class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        parent.children.pop unless parent.nil?
        @parent = new_parent
        parent.children << self unless parent.nil?
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        unless children.include?(child_node)
            raise "Node does not exist"
        end
        child_node.parent = nil
    end
end
