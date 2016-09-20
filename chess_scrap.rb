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

gb_arg.board_hash[piece_to_where.to_sym].current_local = gb_arg.board_hash[arg]