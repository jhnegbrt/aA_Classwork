require_relative "./trees.rb"

class KnightPathFinder

    attr_reader :considered_positions, :root_node

    def self.valid_moves(position)
        array = []

        (0..7).each do |i|
            (0..7).each do |j|
                array << [i, j]
            end
        end

        valid_moves = array.select do |ele|
            x = (ele[0] - position[0]).abs
            y = (ele[1] - position[1]).abs
            (x == 2 || x == 1) && (y == 1 || y == 2) && (x + y == 3)
            # x + y == 3 && ele[0] != position[0] && ele[1] != position[1]
        end
    end


    def initialize(start_position)
        @root_node = PolyTreeNode.new(start_position)
        @considered_positions = [start_position]
        build_move_tree
    end

    def new_move_positions(pos)
        moves = KnightPathFinder.valid_moves(pos).select {|ele| !considered_positions.include?(ele)}
        @considered_positions += moves
        moves
    end

    def build_move_tree
        queue = [root_node]

        while queue.length != 0
            first = queue.shift
            new_move_positions(first.value).each do |position|
                node = PolyTreeNode.new(position)
                node.parent = first
                first.add_child(node)
                queue << node
            end
        end
    end
  

    def find_path(end_pos)
        final_node = root_node.dfs(end_pos)
        trace_path_back(final_node)
    end


    def trace_path_back(final_node)
        array = [final_node.value]
        until final_node == @root_node
            final_node = final_node.parent
            array.unshift(final_node.value)
        end
        
        array    
    end

end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6])
p kpf.find_path([6, 2])