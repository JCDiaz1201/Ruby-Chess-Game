# here for visualization purposes
#
# :a1 :b1 :c1 :d1 :e1 :f1 :g1 :h1 #Black Side
# :a2 :b2 :c2 :d2 :e2 :f2 :g2 :h2
# :a3 :b3 :c3 :d3 :e3 :f3 :g3 :h3
# :a4 :b4 :c4 :d4 :e4 :f4 :g4 :h4
# :a5 :b5 :c5 :d5 :e5 :f5 :g5 :h5
# :a6 :b6 :c6 :d6 :e6 :f6 :g6 :h6
# :a7 :b7 :c7 :d7 :e7 :f7 :g7 :h7
# :a8 :b8 :c8 :d8 :e8 :f8 :g8 :h8 #White Side
#

class GameBoardSetup
	attr_accessor :board_hash

	def initialize
		@board_hash = {
			:a1 => "*", :a2 => "*", :a3 => "*", :a4 => "*", :a5 => "*", :a6 => "*", :a7 => "*", :a8 => "*",
			:b1 => "*", :b2 => "*", :b3 => "*", :b4 => "*", :b5 => "*", :b6 => "*", :b7 => "*", :b8 => "*", 
			:c1 => "*", :c2 => "*", :c3 => "*", :c4 => "*", :c5 => "*", :c6 => "*", :c7 => "*", :c8 => "*", 
			:d1 => "*", :d2 => "*", :d3 => Pawn.new("d3", "White"), :d4 => "*", :d5 => "*", :d6 => Pawn.new("d6", "Black"), :d7 => "*", :d8 => "*",
			:e1 => "*", :e2 => Pawn.new("e2", "Black"), :e3 => "*", :e4 => "*", :e5 => "*", :e6 => "*", :e7 => Pawn.new("e7", "White"), :e8 => "*",
			:f1 => "*", :f2 => "*", :f3 => Pawn.new("f3", "White"), :f4 => "*", :f5 => "*", :f6 => Pawn.new("f6", "Black"), :f7 => "*", :f8 => "*",
			:g1 => "*", :g2 => "*", :g3 => "*", :g4 => "*", :g5 => "*", :g6 => "*", :g7 => "*", :g8 => "*", 
			:h1 => "*", :h2 => "*", :h3 => "*", :h4 => "*", :h5 => "*", :h6 => "*", :h7 => "*", :h8 => "*"
		}
	end
end

class Movement
	attr_accessor :game_board

	def initialize
		@game_board = GameBoardSetup.new
	end

	def starting_spot #trying to display key here for testing purposes
		self.game_board.board_hash.each {|v| puts "#{v}"}
		puts "Please select a unit on the board..."
		piece_to_move = gets.chomp!

		if self.game_board.board_hash[piece_to_move.to_sym] == "*"
			puts "Please select a valid piece that is in play"
			starting_spot
		else
			end_spot(piece_to_move)
		end
	end

	def end_spot(arg)
		puts "Where would you like to move the #{self.game_board.board_hash[arg.to_sym].color} #{self.game_board.board_hash[arg.to_sym].name}" 
		piece_to_where = gets.chomp!

		if self.game_board.board_hash[piece_to_where.to_sym].nil?
			puts "Error, please select a valid spot on the board"
			end_spot(arg)
		elsif self.game_board.board_hash[piece_to_where.to_sym] != "*"
			kill_test = true
			self.game_board.board_hash[arg.to_sym].allowed_moves(piece_to_where, @game_board, kill_test, arg)
		else
			kill_test = false
			self.game_board.board_hash[arg.to_sym].allowed_moves(piece_to_where, @game_board, kill_test, arg)
		end
	end
end

class Pawn
	attr_accessor :name, :value, :current_local, :color

	def initialize(current_local, color)
		@name = Pawn
		@value = 1
		@current_local = current_local
		@color = color
	end

	def allowed_moves(moving_to, gb_arg, kill_test, arg)
		if kill_test == true
			kill_move(moving_to, gb_arg, arg)
		else
			regular_move(moving_to, gb_arg, arg)
		end
	end

	private
		def regular_move(moving_to, gb_arg, arg)

			if @color == "Black"
				move = 1
			else
				move = -1
			end

			dcstr_beg_local = current_local.split("")
			dcstr_end_local = moving_to.split("")
			beg_letter, beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
			end_letter, end_number = dcstr_end_local[0], dcstr_end_local[1]

			if beg_letter == end_letter && end_number.to_i == beg_number.to_i + move
				gb_arg.board_hash[moving_to.to_sym] = gb_arg.board_hash[arg.to_sym]
				gb_arg.board_hash[arg.to_sym] = "*"
				gb_arg.board_hash.each {|v| puts "#{v}"}
#				call back to test1.end_spot
#			elsif
#				option to go back and select another piece, test1.starting_spot
			else
				puts "Please select a valid move for the #{self.color} #{self.name}"
#				call back to test1.end_spot
			end
		end

		def kill_move(moving_to, gb_arg, arg)

			if @color == "Black"
				move = 1
			else
				move = -1
			end

			dcstr_beg_local = current_local.split("")
			dcstr_end_local = moving_to.split("")
			beg_letter, beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
			end_letter, end_number = dcstr_end_local[0], dcstr_end_local[1]
		
			if (beg_letter.ord - end_letter.ord).abs == 1 && (beg_number.to_i + move == end_number.to_i) && (self.color != gb_arg.board_hash[moving_to.to_sym].color)
				gb_arg.board_hash[moving_to.to_sym] == gb_arg.board_hash[arg.to_sym]
				gb_arg.board_hash[arg.to_sym] = "*"
				gb_arg.board_hash.each {|v| puts "#{v}"}
#				call back to test1.end_spot
			else
				puts "Please select a valid attack move for the #{self.color} #{self.name}"
#				call back to test1.end_spot
			end
		end
end

class Rook
	attr_accessor :rook
end

class Knight
	attr_accessor :knight
end

class Bishop
	attr_accessor :bishop
end

class Queen
	attr_accessor :queen
end

class King
	attr_accessor :king
end

test1 = Movement.new
test1.starting_spot







