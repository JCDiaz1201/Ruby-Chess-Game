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
		board_assignments(board_arr)
	end

	def board_assignments(arg) #pass each playable sector of the board to its own unique variable
		a1 = arg[1][1]
		a2 = arg[2][1]
		a3 = arg[3][1]
		a4 = arg[4][1]
		a5 = arg[5][1]
		a6 = arg[6][1]
		a7 = arg[7][1]
		a8 = arg[8][1]
		
		b1 = arg[1][2]
		b2 = arg[2][2]
		b3 = arg[3][2]
		b4 = arg[4][2]
		b5 = arg[5][2]
		b6 = arg[6][2]
		b7 = arg[7][2]
		b8 = arg[8][2]

		c1 = arg[1][3]
		c2 = arg[2][3]
		c3 = arg[3][3]
		c4 = arg[4][3]
		c5 = arg[5][3]
		c6 = arg[6][3]
		c7 = arg[7][3]
		c8 = arg[8][3]

		d1 = arg[1][4]
		d2 = arg[2][4]
		d3 = arg[3][4]
		d4 = arg[4][4]
		d5 = arg[5][4]
		d6 = arg[6][4]
		d7 = arg[7][4]
		d8 = arg[8][4]

		e1 = arg[1][5]
		e2 = arg[2][5]
		e3 = arg[3][5]
		e4 = arg[4][5]
		e5 = arg[5][5]
		e6 = arg[6][5]
		e7 = arg[7][5]
		e8 = arg[8][5]

		f1 = arg[1][6]
		f2 = arg[2][6]
		f3 = arg[3][6]
		f4 = arg[4][6]
		f5 = arg[5][6]
		f6 = arg[6][6]
		f7 = arg[7][6]
		f8 = arg[8][6]

		g1 = arg[1][7]
		g2 = arg[2][7]
		g3 = arg[3][7]
		g4 = arg[4][7]
		g5 = arg[5][7]
		g6 = arg[6][7]
		g7 = arg[7][7]
		g8 = arg[8][7]

		h1 = arg[1][8]
		h2 = arg[2][8]
		h3 = arg[3][8]
		h4 = arg[4][8]
		h5 = arg[5][8]
		h6 = arg[6][8]
		h7 = arg[7][8]
		h8 = arg[8][8]
	end
end

foo = GameBoardSetup.new
foo.game_board





