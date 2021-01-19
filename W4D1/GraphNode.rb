require "byebug"

class GraphNode

    attr_accessor :val, :neighbors

    def initialize(val, neighbors = [])
        @val = val
        @neighbors = neighbors
    end

    def inspect
        # "Value: #{@val}, Neighbors: #{@neighbors}"
        @val
    end
end

def bfs(start_node, target_value)

    queue = [start_node]
    nodes_seen = Set.new()
    until queue.empty?
        node = queue.shift
        next if nodes_seen.include?(node)
        return node if node.val == target_value
        nodes_seen << node
        queue += node.neighbors unless node.neighbors.empty?
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
