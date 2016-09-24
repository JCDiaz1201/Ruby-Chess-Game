#logic for def end_spot
if self.game_board.board_hash[piece_to_where.to_sym].nil?
	puts "Error, please select a valid spot on the board"
	end_spot(arg)
elsif self.game_board.board_hash[arg.to_sym] != "*"
	kill(arg, piece_to_where)
else
	self.game_board.board_hash[piece_to_where.to_sym] = self.game_board.board_hash[arg.to_sym]
	self.game_board.board_hash[arg.to_sym] = "*"
	self.game_board.board_hash.each {|v| puts "#{v}"}
	starting_spot
end

gb_arg.board_hash[piece_to_where.to_sym].current_local = 



		if gb_arg.board_hash[piece_to_move.to_sym].name == gb_arg.board_hash[piece_to_move.to_sym].name = "Pawn" && kill_test == true  #|| gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "King" || gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "Knight"
			kill_move(piece_to_where, gb_arg, piece_to_move)
		elsif gb_arg.board_hash[piece_to_move.to_sym].name == gb_arg.board_hash[piece_to_move.to_sym].name = "Pawn" && kill_test == false #|| gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "King" || gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "Knight"
			regular_move(piece_to_where, gb_arg, piece_to_move)
		elsif gb_arg.board_hash[piece_to_move.to_sym].name == gb_arg.board_hash[piece_to_move.to_sym].name = "Rook" && kill_test == true #|| gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "Bishop" || gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "Queen"
			allowed_moves_test(piece_to_where, gb_arg, piece_to_move)
		elsif gb_arg.board_hash[piece_to_move.to_sym].name == gb_arg.board_hash[piece_to_move.to_sym].name = "Rook" && kill_test == false #|| (gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "Bishop" || gb_arg.board_hash[piece_to_move.to_sym] == gb_arg.board_hash[piece_to_move.to_sym].name = "Queen"
			allowed_moves_test(piece_to_where, gb_arg, piece_to_move)
		else
			puts "Error"
			exit
		end
	end

	def allowed_moves_test(piece_to_where, gb_arg, piece_to_move)
		puts true
	end




	def regular_move_test(piece_to_where, gb_arg, piece_to_move)
		puts "Reg Move"

		move_array = []
		dcstr_beg_local = current_local.split("")
		dcstr_end_local = piece_to_where.split("")
		beg_letter, beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
		end_letter, end_number = dcstr_end_local[0], dcstr_end_local[1]

		if ((beg_number > end_number || beg_number < end_number) && (beg_letter == end_letter))
			if (beg_number - end_number).abs > 2
				puts ""
			else
				#place function
			end
		else
			if (beg_letter.ord - end_letter.ord).abs > 2
				puts ""
			else 
				#place function
			end
		end
#		move_array.push(gb_arg.board_hash[piece_to_move.to_sym].name)
	end



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








