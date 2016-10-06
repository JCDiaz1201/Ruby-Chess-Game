require './pawn'
require './knight'
require './rook'
require './bishop'
require './queen'
require './king'
 
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

#	def initialize
#		@board_hash = {
#			:a1 => Rook.new("a1", "Black"), :a2 => Pawn.new("a2", "Black"), :a3 => "*", :a4 => "*", :a5 => "*", :a6 => "*", :a7 => Pawn.new("a7", "White"), :a8 => Rook.new("a8", "White"),
#			:b1 => Knight.new("b1", "Black"), :b2 => Pawn.new("b2", "Black"), :b3 => "*", :b4 => "*", :b5 => "*", :b6 => "*", :b7 => Pawn.new("b7", "White"), :b8 => Knight.new("b8", "White"), 
#			:c1 => Bishop.new("c1", "Black"), :c2 => Pawn.new("c2", "Black"), :c3 => "*", :c4 => "*", :c5 => "*", :c6 => "*", :c7 => Pawn.new("c7", "White"), :c8 => Bishop.new("c8", "White"), 
#			:d1 => King.new("d1", "Black"), :d2 => Pawn.new("d2", "Black"), :d3 => "*", :d4 => "*", :d5 => "*", :d6 => "*", :d7 => Pawn.new("d7", "White"), :d8 => Queen.new("d8", "White"),
#			:e1 => Queen.new("e1", "Black"), :e2 => Pawn.new("e2", "Black"), :e3 => "*", :e4 => "*", :e5 => "*", :e6 => "*", :e7 => Pawn.new("e7", "White"), :e8 => King.new("e8", "White"),
#			:f1 => Bishop.new("f1", "Black"), :f2 => Pawn.new("f2", "Black"), :f3 => "*", :f4 => "*", :f5 => "*", :f6 => "*", :f7 => Pawn.new("f7", "White"), :f8 => Bishop.new("f8", "White"),
#			:g1 => Knight.new("g1", "Black"), :g2 => Pawn.new("g2", "Black"), :g3 => "*", :g4 => "*", :g5 => "*", :g6 => "*", :g7 => Pawn.new("g7", "White"), :g8 => Knight.new("g8", "White"), 
#			:h1 => Rook.new("h1", "Black"), :h2 => Pawn.new("h2", "Black"), :h3 => "*", :h4 => "*", :h5 => "*", :h6 => "*", :h7 => Pawn.new("h7", "White"), :h8 => Rook.new("h8", "White")
#		}
#	end

	def initialize
		@board_hash = {
			:a1 => Rook.new("a1", "Black"), :b1 => Knight.new("b1", "Black"), :c1 => Bishop.new("c1", "Black"), :d1 => Queen.new("d1", "Black"), :e1 => King.new("e1", "Black"), :f1 => Bishop.new("f1", "Black"), :g1 => Knight.new("g1", "Black"), :h1 => Rook.new("h1", "Black"),
			:a2 => Pawn.new("a2", "Black"), :b2 => Pawn.new("b2", "Black"), :c2 => Pawn.new("c2", "Black"), :d2 => Pawn.new("d2", "Black"), :e2 => Pawn.new("e2", "Black"), :f2 => Pawn.new("f2", "Black"), :g2 => Pawn.new("g2", "Black"), :h2 => Pawn.new("h2", "Black"),
			:a3 => "*", :b3 => "*", :c3 => "*", :d3 => "*", :e3 => "*", :f3 => "*", :g3 => "*", :h3 => "*",
			:a4 => "*", :b4 => "*", :c4 => "*", :d4 => "*", :e4 => "*", :f4 => "*", :g4 => "*", :h4 => "*",
			:a5 => "*", :b5 => "*", :c5 => "*", :d5 => "*", :e5 => "*", :f5 => "*", :g5 => "*", :h5 => "*",
			:a6 => "*", :b6 => "*", :c6 => "*", :d6 => "*", :e6 => "*", :f6 => "*", :g6 => "*", :h6 => "*",
			:a7 => Pawn.new("a7", "White"), :b7 => Pawn.new("b7", "White"), :c7 => Pawn.new("c7", "White"), :d7 => Pawn.new("d7", "White"), :e7 => Pawn.new("e7", "White"), :f7 => Pawn.new("f7", "White"), :g7 => Pawn.new("g7", "White"), :h7 => Pawn.new("h7", "White"),
			:a8 => Rook.new("a8", "White"), :b8 => Knight.new("b8", "White"), :c8 => Bishop.new("c8", "White"), :d8 => King.new("d8", "White"), :e8 => Queen.new("e8", "White"), :f8 => Bishop.new("f8", "White"), :g8 => Knight.new("g8", "White"), :h8 => Rook.new("h8", "White")
		}
	end


	def display_board
		row_array = []
		game_array = []

		@board_hash.each_with_index do | (k, v), index |
			if v != "*"
			  row_array << v.piece_display
				if (index + 1) % 8 == 0
					game_array << row_array
					row_array = []
				end
			else
				row_array << v
					if (index + 1) % 8 == 0
						game_array << row_array
						row_array = []
					end
				end
			end
		game_array.each do |row_array|
			puts row_array.join(" ")
		end
	end
end

class Movement
	attr_accessor :game_board

	def initialize
		@game_board = GameBoardSetup.new
	end

	def main_menu
		puts 
		puts "Hello and welcome to JD's chess game!"
		puts 
		puts "Instuctions:"
		puts "Please select the piece you would like to move by the its place on the board."
		puts "For example if a rook is on a2, enter in 'a2'"
		puts "In order to move a piece once it is selected please select the place a place on the board"
		puts "you would like to move your selected piece." 
		puts "For example, if you would like to move to space g6 enter in 'g6'."
		puts
		puts "Have fun please enter in the word 'play' in order to start the game!"
		puts "To exit the game just type exit."

		player_selection = gets.chomp!
		if player_selection == 'play'
			puts
			starting_spot
		else
			exit
		end
	end

	def starting_spot 
#		self.game_board.board_hash.each do |v|
#			p v 
#		end

		self.game_board.display_board

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

game = Movement.new
game.main_menu







