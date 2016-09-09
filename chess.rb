class GameBoardSetup
	def game_board #define and set up the board
		board_arr = [
			["", "A", "B", "C", "D", "E", "F", "G", "H"],
			[1, "*", "*", "*", "*", "*", "*", "*", "*"],
			[2, "*", "*", "*", "*", "*", "*", "*", "*"],
			[3, "*", "*", "*", "*", "*", "*", "*", "*"],
			[4, "*", "*", "*", "*", "*", "*", "*", "*"],
			[5, "*", "*", "*", "*", "*", "*", "*", "*"],
			[6, "*", "*", "*", "*", "*", "*", "*", "*"],
			[7, "*", "*", "*", "*", "*", "*", "*", "*"],
			[8, "*", "*", "*", "*", "*", "*", "*", "*"]
		]

		a1 = board_arr[1][1]
		a2 = board_arr[2][1]
		a3 = board_arr[3][1]
		a4 = board_arr[4][1]
		a5 = board_arr[5][1]
		a6 = board_arr[6][1]
		a7 = board_arr[7][1]
		a8 = board_arr[8][1]
		
		b1 = board_arr[1][2]
		b2 = board_arr[2][2]
		b3 = board_arr[3][2]
		b4 = board_arr[4][2]
		b5 = board_arr[5][2]
		b6 = board_arr[6][2]
		b7 = board_arr[7][2]
		b8 = board_arr[8][2]

		c1 = board_arr[1][3]
		c2 = board_arr[2][3]
		c3 = board_arr[3][3]
		c4 = board_arr[4][3]
		c5 = board_arr[5][3]
		c6 = board_arr[6][3]
		c7 = board_arr[7][3]
		c8 = board_arr[8][3]

		d1 = board_arr[1][4]
		d2 = board_arr[2][4]
		d3 = board_arr[3][4]
		d4 = board_arr[4][4]
		d5 = board_arr[5][4]
		d6 = board_arr[6][4]
		d7 = board_arr[7][4]
		d8 = board_arr[8][4]

		e1 = board_arr[1][5]
		e2 = board_arr[2][5]
		e3 = board_arr[3][5]
		e4 = board_arr[4][5]
		e5 = board_arr[5][5]
		e6 = board_arr[6][5]
		e7 = board_arr[7][5]
		e8 = board_arr[8][5]

		f1 = board_arr[1][6]
		f2 = board_arr[2][6]
		f3 = board_arr[3][6]
		f4 = board_arr[4][6]
		f5 = board_arr[5][6]
		f6 = board_arr[6][6]
		f7 = board_arr[7][6]
		f8 = board_arr[8][6]

		g1 = board_arr[1][7]
		g2 = board_arr[2][7]
		g3 = board_arr[3][7]
		g4 = board_arr[4][7]
		g5 = board_arr[5][7]
		g6 = board_arr[6][7]
		g7 = board_arr[7][7]
		g8 = board_arr[8][7]

		h1 = board_arr[1][8]
		h2 = board_arr[2][8]
		h3 = board_arr[3][8]
		h4 = board_arr[4][8]
		h5 = board_arr[5][8]
		h6 = board_arr[6][8]
		h7 = board_arr[7][8]
		h8 = board_arr[8][8]

		p board_arr
		p \n
		p h1
		
	end
end

class Movement < GameBoardSetup
	def starting_point
		new_game = GameBoardSetup.new
		new_game.game_board
	end
end




new1 = Movement.new
new1.starting_point






