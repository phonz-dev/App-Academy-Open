class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value, @parent, @children = value, nil, []
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

    def dfs(target_value)
        return self if value == target_value
        children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end
        nil
    end

    def bfs(target_value)
        return self if value == target_value
        queue = [self]
        until queue.empty?
            node = queue.shift
            node.children.each do |child|
                return child if child.value == target_value
                queue << child
            end
        end
        nil
    end
end
