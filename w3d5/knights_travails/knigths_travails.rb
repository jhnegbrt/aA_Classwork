require_relative "./trees.rb"

class KnightPathFinder

    def self.valid_moves(position)

        debugger
        pos = [0,0]
        valid_moves = []
        [-1..1].each do |i|
            [-1..1].each do |j|
                valid_moves << [pos[0] + i, pos[1] + j]
            end
        end

        valid_moves
        num1 += 1
        num2
        num1 += 1
        num2 += 1
        num

    end


    def initialize
        @root_node = PolyTreeNode.new([0,0])
        build_move_tree
    end

    def build_move_tree

    end



end

# kpf = KnightPathFinder.new([0, 0])