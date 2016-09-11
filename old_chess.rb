class GameBoardSetup
	attr_accessor :board_arr, :a1, :a2, :a3, :a4, :a5,:a6, :a7,
	:a8, :b1, :b2, :b3, :b4, :b5, :b6, :b7, :b8, :c1, :c2, :c3, 
	:c4, :c5, :c6, :c7, :c8, :d1, :d2, :d3, :d4, :d5, :d6, :d7, 
	:d8, :e1, :e2, :e3, :e4, :e5, :e6, :e7, :e8, :f1, :f2, :f3,
	:f4, :f5, :f6, :f7, :f8, :g1, :g2, :g3, :g4, :g5, :g6, :g7,
	:g8, :h1, :h2, :h3, :h4, :h5, :h6, :h7, :h8

	def initialize
		@board_arr = [
			[" ", "A", "B", "C", "D", "E", "F", "G", "H"],
			["1", "*", "*", "*", "*", "*", "*", "*", "*"],
			["2", "*", "*", "*", "*", "*", "*", "*", "*"],
			["3", "*", "*", "*", "*", "*", "*", "*", "*"],
			["4", "*", "*", "*", "*", "*", "*", "*", "*"],
			["5", "*", "*", "*", "*", "*", "*", "*", "*"],
			["6", "*", "*", "*", "*", "*", "*", "*", "*"],
			["7", "*", "*", "*", "*", "*", "*", "*", "*"],
			["8", "*", "*", "*", "*", "*", "*", "*", "*"]
		]

		@a1 = board_arr[1][1]
		@a2 = board_arr[2][1]
		@a3 = board_arr[3][1]
		@a4 = board_arr[4][1]
		@a5 = board_arr[5][1]
		@a6 = board_arr[6][1]
		@a7 = board_arr[7][1]
		@a8 = board_arr[8][1]
		
		@b1 = board_arr[1][2]
		@b2 = board_arr[2][2]
		@b3 = board_arr[3][2]
		@b4 = board_arr[4][2]
		@b5 = board_arr[5][2]
		@b6 = board_arr[6][2]
		@b7 = board_arr[7][2]
		@b8 = board_arr[8][2]

		@c1 = board_arr[1][3]
		@c2 = board_arr[2][3]
		@c3 = board_arr[3][3]
		@c4 = board_arr[4][3]
		@c5 = board_arr[5][3]
		@c6 = board_arr[6][3]
		@c7 = board_arr[7][3]
		@c8 = board_arr[8][3]

		@d1 = board_arr[1][4]
		@d2 = board_arr[2][4]
		@d3 = board_arr[3][4]
		@d4 = board_arr[4][4]
		@d5 = board_arr[5][4]
		@d6 = board_arr[6][4]
		@d7 = board_arr[7][4]
		@d8 = board_arr[8][4]

		@e1 = board_arr[1][5]
		@e2 = board_arr[2][5]
		@e3 = board_arr[3][5]
		@e4 = board_arr[4][5]
		@e5 = board_arr[5][5]
		@e6 = board_arr[6][5]
		@e7 = board_arr[7][5]
		@e8 = board_arr[8][5]

		@f1 = board_arr[1][6]
		@f2 = board_arr[2][6]
		@f3 = board_arr[3][6]
		@f4 = board_arr[4][6]
		@f5 = board_arr[5][6]
		@f6 = board_arr[6][6]
		@f7 = board_arr[7][6]
		@f8 = board_arr[8][6]

		@g1 = board_arr[1][7]
		@g2 = board_arr[2][7]
		@g3 = board_arr[3][7]
		@g4 = board_arr[4][7]
		@g5 = board_arr[5][7]
		@g6 = board_arr[6][7]
		@g7 = board_arr[7][7]
		@g8 = board_arr[8][7]

		@h1 = board_arr[1][8]
		@h2 = board_arr[2][8]
		@h3 = board_arr[3][8]
		@h4 = board_arr[4][8]
		@h5 = board_arr[5][8]
		@h6 = board_arr[6][8]
		@h7 = board_arr[7][8]
		@h8 = board_arr[8][8]
	end
end

class Movement 
	attr_accessor :game_board

	def initialize
		@game_board = GameBoardSetup.new
	end

	def start
		puts self.game_board.board_arr.a1						#place pawn in a1 on the board
#		self.game_board.a1 = "P"
#		puts_screen
	end

	def puts_screen
		self.game_board.board_arr.each do |x|		#see if placing the pawn there works
			p x
		end
	end

end

player = Movement.new
player.start
#player.move
#player.end







