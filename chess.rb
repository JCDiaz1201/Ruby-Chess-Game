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

	def initialize
		@board_hash = {
			:a1 => Rook.new("a1", "Black"), :a2 => Knight.new("a2", "Black"), :a3 => Bishop.new("a3", "Black"), :a4 => Queen.new("a4", "Black"), :a5 => King.new("a5", "Black"), :a6 => Bishop.new("a6", "Black"), :a7 => Knight.new("a7", "Black"), :a8 => Rook.new("a8", "Black"),
			:b1 => Pawn.new("b1", "Black"), :b2 => Pawn.new("b2", "Black"), :b3 => Pawn.new("b3", "Black"), :b4 => Pawn.new("b4", "Black"), :b5 => Pawn.new("b5", "Black"), :b6 => Pawn.new("b6", "Black"), :b7 => Pawn.new("b7", "Black"), :b8 => Pawn.new("b8", "Black"), 
			:c1 => "*", :c2 => "*", :c3 => "*", :c4 => "*", :c5 => "*", :c6 => "*", :c7 => "*", :c8 => "*", 
			:d1 => "*", :d2 => "*", :d3 => "*", :d4 => "*", :d5 => "*", :d6 => "*", :d7 => "*", :d8 => "*",
			:e1 => "*", :e2 => "*", :e3 => "*", :e4 => "*", :e5 => "*", :e6 => "*", :e7 => "*", :e8 => "*",
			:f1 => "*", :f2 => "*", :f3 => "*", :f4 => "*", :f5 => "*", :f6 => "*", :f7 => "*", :f8 => "*",
			:g1 => Pawn.new("g1", "White"), :g2 => Pawn.new("g2", "White"), :g3 => Pawn.new("g3", "White"), :g4 => Pawn.new("g4", "White"), :g5 => Pawn.new("g5", "White"), :g6 => Pawn.new("g6", "White"), :g7 => Pawn.new("g7", "White"), :g8 => Pawn.new("g8", "White"), 
			:h1 => Rook.new("h1", "White"), :h2 => Knight.new("h2", "White"), :h3 => Bishop.new("h3", "White"), :h4 => King.new("h4", "White"), :h5 => Queen.new("h5", "White"), :h6 => Bishop.new("h6", "White"), :h7 => Knight.new("h7", "White"), :h8 => Rook.new("h8", "White")
		}
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
		self.game_board.board_hash.each {|k| puts "#{k}"}
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







