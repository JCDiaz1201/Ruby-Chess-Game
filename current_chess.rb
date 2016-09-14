# here for visualization purposes
#
# :a1 :b1 :c1 :d1 :e1 :f1 :g1 :h1
# :a2 :b2 :c2 :d2 :e2 :f2 :g2 :h2
# :a3 :b3 :c3 :d3 :e3 :f3 :g3 :h3
# :a4 :b4 :c4 :d4 :e4 :f4 :g4 :h4
# :a5 :b5 :c5 :d5 :e5 :f5 :g5 :h5
# :a6 :b6 :c6 :d6 :e6 :f6 :g6 :h6
# :a7 :b7 :c7 :d7 :e7 :f7 :g7 :h7
# :a8 :b8 :c8 :d8 :e8 :f8 :g8 :h8
#

class GameBoardSetup
	attr_accessor :board_hash, :pawn, :rook, :knight, :bishop, :queen, :king

	def initialize
		@pawn = Pawn.new
		@rook = Rook.new
		@knight = Knight.new
		@bishop = Bishop.new
		@queen = Queen.new
		@king = King.new
		@board_hash = {
			:a1 => "*", :a2 => "*", :a3 => "*", :a4 => "*", :a5 => "*",
			:a6 => "*", :a7 => @pawn,:a8 => @rook, :b1 => "*", :b2 => "*",
			:b3 => "*", :b4 => "*", :b5 => "*", :b6 => "*", :b7 => @pawn,
			:b8 => @knight, :c1 => "*", :c2 => "*", :c3 => "*", :c4 => "*",
			:c5 => "*", :c6 => "*", :c7 => @pawn, :c8 => @bishop,:d1 => "*",
			:d2 => "*", :d3 => "*", :d4 => "*", :d5 => "*", :d6 => "*",
			:d7 => @pawn, :d8 => @king, :e1 => "*", :e2 => "*", :e3 => "*",
			:e4 => "*", :e5 => "*", :e6 => "*", :e7 => @pawn, :e8 => @queen,
			:f1 => "*", :f2 => "*", :f3 => "*", :f4 => "*", :f5 => "*",
			:f6 => "*", :f7 => @pawn, :f8 => @bishop, :g1 => "*", :g2 => "*",
			:g3 => "*", :g4 => "*", :g5 => "*", :g6 => "*", :g7 => @pawn,
			:g8 => @knight, :h1 => "*", :h2 => "*", :h3 => "*", :h4 => "*", 
			:h5 => "*", :h6 => "*", :h7 => @pawn, :h8 => @rook
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

		puts "Please select a pawn on the board..."
		piece_to_move = gets.chomp!

		if self.game_board.board_hash[piece_to_move.to_sym] == "*"
			puts "Please select a valid piece that is in play"
			starting_spot
		else
			end_spot(piece_to_move)
		end
	end

	def end_spot(arg)
		puts "Where would you like to move the piece?"
		piece_to_where = gets.chomp!
		if self.game_board.board_hash[piece_to_where.to_sym].nil?
			puts "Error, please select a valid spot on the board"
			end_spot(arg)
		elsif self.game_board.board_hash[arg.to_sym] == @pawn; @rook; @knight; @bishop; @queen; @king
			kill(arg, piece_to_where)
		else
			self.game_board.board_hash[piece_to_where.to_sym] = self.game_board.board_hash[arg.to_sym]
			self.game_board.board_hash[arg.to_sym] = "*"
			self.game_board.board_hash.each {|v| puts "#{v}"}
		end
	end

	def kill(arg, arg2)
		self.game_board.board_hash[arg.to_sym] = "*"
		self.game_board.board_hash[arg2.to_sym] == self.game_board.board_hash[arg.to_sym]
		self.game_board.board_hash.each {|v| puts "#{v}"}
	end
end

class Pawn
	attr_accessor :pawn
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







