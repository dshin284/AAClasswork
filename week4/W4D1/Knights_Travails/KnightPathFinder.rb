require_relative "./PolyTreeNode.rb"

class KnightPathFinder

    #attr_reader :root
    attr_accessor :considered_positions, :root_node

    def initialize(coordinate)
        @considered_positions = [coordinate]
        build_move_tree(coordinate)
    end

    def self.valid_moves(coord)
        row = coord.first
        col = coord.last
        #passes in a coordinate and 
        #returns an array of all possible moves
        all_moves = []
        #possible north moves
        move_1 = [row - 2, col + 1]
        move_2 = [row - 2, col - 1]
        all_moves << move_1 if move_1[0].between?(0, 7) && move_1[1].between?(0, 7)
        all_moves << move_2 if move_2[0].between?(0, 7) && move_1[1].between?(0, 7) 
        
        #possible south moves
        move_3 = [row + 2 , col + 1]
        move_4 = [row + 2, col - 1]
        all_moves << move_3 if move_3[0].between?(0, 7) && move_3[1].between?(0, 7) 
        all_moves << move_4 if move_4[0].between?(0, 7) && move_4[1].between?(0, 7) 

        #possible west moves
        move_5 = [row - 1, col - 2]
        move_6 = [row + 1, col - 2]
        all_moves << move_5 if move_5[0].between?(0, 7) && move_5[1].between?(0, 7) 
        all_moves << move_6 if move_6[0].between?(0, 7) && move_6[1].between?(0, 7) 

        #possible east moves
        move_7 = [row + 1 , col + 2 ]
        move_8 = [row - 1 , col + 2 ]
        all_moves << move_7 if move_7[0].between?(0, 7) && move_7[1].between?(0, 7) 
        all_moves << move_8 if move_8[0].between?(0, 7) && move_8[1].between?(0, 7) 

        return all_moves
    end

    def new_move_positions(pos)
        #Only return positions not inside 
        not_considered_pos = KnightPathFinder.valid_moves(pos)
        not_considered_pos.reject!{ |pos| @considered_positions.include?(pos)}
        not_considered_pos.each { |pos| @considered_positions << pos if (pos[0] >= 0 && pos[1] >= 0 )}
    end

    def build_move_tree(coord)
        #BFS
        self.root_node = PolyTreeNode.new(coord)
        queue = [self.root_node]
        while !queue.empty?
            parent_node = queue.shift
            new_move_positions(parent_node.value).each do |pos|
                child_node =  PolyTreeNode.new(pos)
                #make the connection
                parent_node.add_child(child_node)
                queue << child_node
            end

        end
    end

    def find_path(end_pos)
       #Returns the PolyTreeNode containing end_pos
       destin_node = self.root_node.dfs(end_pos)
       path = trace_path_back(destin_node)
       path.reverse.map!{ |node| node.value }
    end

    def trace_path_back(target_node)
        #Returns the values in an array in order from the start pos to end pos.
        bottom_to_root_path_arr = []
        #In the curr_node, check if parent exists.
        #If parent exists, curr_node = parent_node
        #Shovel in the parent_node to bottom_to_root_path_arr
        while target_node != nil
            bottom_to_root_path_arr << target_node
            target_node = target_node.parent
        end
        return bottom_to_root_path_arr
    end

    # kpf = KnightPathFinder.new([0, 0])
    # kpf.finzd_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
    # kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
end



if __FILE__ == $0
    k1 = KnightPathFinder.new([0,0])
    p k1.find_path([7, 6])
    p k1.find_path([6, 2])
end