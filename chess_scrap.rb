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