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
			:a1 => "*", :a2 => "*", :a3 => "*", :a4 => Pawn.new("a4", "White"), :a5 => "*", :a6 => "*", :a7 => "*", :a8 => "*",
			:b1 => "*", :b2 => "*", :b3 => "*", :b4 => "*", :b5 => "*", :b6 => "*", :b7 => Pawn.new("b7", "White"), :b8 => "*", 
			:c1 => "*", :c2 => "*", :c3 => "*", :c4 => Pawn.new("d1", "Black"), :c5 => "*", :c6 => "*", :c7 => "*", :c8 => "*", 
			:d1 => Pawn.new("d1", "Black"), :d2 => "*", :d3 => "*", :d4 => Rook.new("d4", "Black"), :d5 => "*", :d6 => "*", :d7 => Pawn.new("d7", "Black"), :d8 => Pawn.new("d8", "White"),
			:e1 => "*", :e2 => "*", :e3 => "*", :e4 => "*", :e5 => "*", :e6 => "*", :e7 => "*", :e8 => "*",
			:f1 => "*", :f2 => "*", :f3 => "*", :f4 => "*", :f5 => "*", :f6 => "*", :f7 => "*", :f8 => "*",
			:g1 => "*", :g2 => "*", :g3 => "*", :g4 => "*", :g5 => "*", :g6 => "*", :g7 => "*", :g8 => "*", 
			:h1 => "*", :h2 => "*", :h3 => "*", :h4 => Pawn.new("h4", "White"), :h5 => "*", :h6 => "*", :h7 => "*", :h8 => "*"
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

	def end_spot(piece_to_move)
		puts "Where would you like to move the #{self.game_board.board_hash[piece_to_move.to_sym].color} #{self.game_board.board_hash[piece_to_move.to_sym].name}"
		puts "If you would like to select another piece to move please type in 'another' "
		piece_to_where = gets.chomp!

		if piece_to_where == "another"
			starting_spot
		elsif self.game_board.board_hash[piece_to_where.to_sym].nil?
			puts "Error, please select a valid spot on the board"
			end_spot(piece_to_move)
		elsif self.game_board.board_hash[piece_to_where.to_sym] != "*"
			kill_test = true
			self.game_board.board_hash[piece_to_move.to_sym].allowed_moves(piece_to_where, @game_board, kill_test, piece_to_move)
			starting_spot
		else
			kill_test = false
			self.game_board.board_hash[piece_to_move.to_sym].allowed_moves(piece_to_where, @game_board, kill_test, piece_to_move)
			starting_spot
		end
	end
end

class Pawn
	attr_accessor :name, :value, :current_local, :color

	def initialize(current_local, color)
		@name = "Pawn"
		@value = 1
		@current_local = current_local
		@color = color
	end

	def allowed_moves(piece_to_where, gb_arg, kill_test, piece_to_move)

		if kill_test == true && gb_arg.board_hash[piece_to_move.to_sym].name == gb_arg.board_hash[piece_to_move.to_sym].name = "Pawn" #|| gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "King" || gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "Knight"
			kill_move(piece_to_where, gb_arg, piece_to_move)
		elsif kill_test == false && gb_arg.board_hash[piece_to_move.to_sym].name == gb_arg.board_hash[piece_to_move.to_sym].name = "Pawn" #|| gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "King" || gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "Knight"
			regular_move(piece_to_where, gb_arg, piece_to_move)
		else
			puts "Error"
			exit
		end
	end

	def allowed_moves_test(piece_to_where, gb_arg, piece_to_move)
		puts true
	end

	private
		def regular_move(piece_to_where, gb_arg, piece_to_move)

			if @color == "Black"
				move = 1
			else
				move = -1
			end

			dcstr_beg_local = current_local.split("")
			dcstr_end_local = piece_to_where.split("")
			beg_letter, beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
			end_letter, end_number = dcstr_end_local[0], dcstr_end_local[1]

			if beg_letter == end_letter && end_number.to_i == beg_number.to_i + move
				gb_arg.board_hash[piece_to_where.to_sym] = gb_arg.board_hash[piece_to_move.to_sym]
				gb_arg.board_hash[piece_to_where.to_sym].current_local = piece_to_where
				gb_arg.board_hash[piece_to_move.to_sym] = "*"
			else
				puts "Please select a valid move for the #{self.color} #{self.name}"
			end
		end

		def kill_move(piece_to_where, gb_arg, piece_to_move)

			if @color == "Black"
				move = 1
			else
				move = -1
			end

			dcstr_beg_local = current_local.split("")
			dcstr_end_local = piece_to_where.split("")
			beg_letter, beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
			end_letter, end_number = dcstr_end_local[0], dcstr_end_local[1]
		
			if (beg_letter.ord - end_letter.ord).abs == 1 && (beg_number.to_i + move == end_number.to_i) && (self.color != gb_arg.board_hash[piece_to_where.to_sym].color)
				puts "#{self.color} #{self.name} takes #{gb_arg.board_hash[piece_to_where.to_sym].color} #{gb_arg.board_hash[piece_to_where.to_sym].name}"
				gb_arg.board_hash[piece_to_where.to_sym] = gb_arg.board_hash[piece_to_move.to_sym]
				gb_arg.board_hash[piece_to_where.to_sym].current_local = piece_to_where
				gb_arg.board_hash[piece_to_move.to_sym] = "*"
			else
				puts "Please select a valid attack move for the #{self.color} #{self.name}"
			end
		end
end

class Rook
	attr_accessor :name, :value, :current_local, :color

	def initialize(current_local, color)
		@name = "Rook"
		@value = 5
		@current_local = current_local
		@color = color
	end

	def allowed_moves(piece_to_where, gb_arg, kill_test, piece_to_move)

		if kill_test == true && gb_arg.board_hash[piece_to_move.to_sym].name == gb_arg.board_hash[piece_to_move.to_sym].name = "Rook" #|| gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "Bishop" || gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "Queen"
			allowed_moves_test(piece_to_where, gb_arg, piece_to_move)
		elsif kill_test == false && gb_arg.board_hash[piece_to_move.to_sym].name == gb_arg.board_hash[piece_to_move.to_sym].name = "Rook" #|| (gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "Bishop" || gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "Queen"
			allowed_moves_test(piece_to_where, gb_arg, piece_to_move)
		else
			puts "Error"
			exit
		end
	end

	def allowed_moves_test(piece_to_where, gb_arg, piece_to_move)
		puts true
	end

	private
		def regular_move(piece_to_where, gb_arg, piece_to_move)

			dcstr_beg_local = current_local.split("")
			dcstr_end_local = piece_to_where.split("")
			beg_letter, beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
			end_letter, end_number = dcstr_end_local[0], dcstr_end_local[1]

			if (beg_letter == end_letter) && ((end_number.to_i >= 1) && (end_number.to_i <= 8)) || ((end_number.to_i == beg_number.to_i) && ((end_letter.ord) >= 97 && (end_letter.ord <= 104)))
				gb_arg.board_hash[piece_to_where.to_sym] = gb_arg.board_hash[piece_to_move.to_sym]
				gb_arg.board_hash[piece_to_where.to_sym].current_local = piece_to_where
				gb_arg.board_hash[piece_to_move.to_sym] = "*"
			else
				puts "Please select a valid move for the #{self.color} #{self.name}"
			end
		end

		def kill_move(piece_to_where, gb_arg, piece_to_move)

			dcstr_beg_local = current_local.split("")
			dcstr_end_local = piece_to_where.split("")
			beg_letter, beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
			end_letter, end_number = dcstr_end_local[0], dcstr_end_local[1]

			if (beg_letter == end_letter) && ((end_number.to_i >= 1) && (end_number.to_i <= 8) && (self.color != gb_arg.board_hash[piece_to_where.to_sym].color)) || ((end_number.to_i == beg_number.to_i) && ((end_letter.ord) >= 97 && (end_letter.ord <= 104)) && (self.color != gb_arg.board_hash[piece_to_where.to_sym].color))
				puts "#{self.color} #{self.name} takes #{gb_arg.board_hash[piece_to_where.to_sym].color} #{gb_arg.board_hash[piece_to_where.to_sym].name}"
				gb_arg.board_hash[piece_to_where.to_sym] = gb_arg.board_hash[piece_to_move.to_sym]
				gb_arg.board_hash[piece_to_where.to_sym].current_local = piece_to_where
				gb_arg.board_hash[piece_to_move.to_sym] = "*"
			else
				puts "Please select a valid attack move for the #{self.color} #{self.name}"
			end
		end

end

class Knight
	attr_accessor :name, :value, :current_local, :color
end

class Bishop
	attr_accessor :name, :value, :current_local, :color
end

class Queen
	attr_accessor :name, :value, :current_local, :color
end

class King
	attr_accessor :name, :value, :current_local, :color
end

game = Movement.new
game.starting_spot







