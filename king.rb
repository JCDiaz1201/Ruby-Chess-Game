class King
	attr_accessor :name, :value, :current_local, :color

	def initialize(current_local, color)
		@name = "King"
		@value = 1000
		@current_local = current_local
		@color = color
	end

	def allowed_moves(piece_to_where, gb_arg, kill_test, piece_to_move)

		if kill_test == true 
			kill_move(piece_to_where, gb_arg, piece_to_move)
		elsif kill_test == false
			regular_move(piece_to_where, gb_arg, piece_to_move)
		else
			puts "An error occured, please retry your move again... "
		end
	end

	def regular_move(piece_to_where, gb_arg, piece_to_move)
		dcstr_beg_local = current_local.split("")
		dcstr_end_local = piece_to_where.split("")
		beg_letter, beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
		end_letter, end_number = dcstr_end_local[0], dcstr_end_local[1]

		if (end_number.to_i - beg_number.to_i).abs == 1 || ((beg_letter.ord) - (end_letter.ord)).abs == 1
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
	
		if ((end_number.to_i - beg_number.to_i).abs == 1 || ((beg_letter.ord) - (end_letter.ord)).abs == 1) && (self.color != gb_arg.board_hash[piece_to_where.to_sym].color)
			puts "#{self.color} #{self.name} takes #{gb_arg.board_hash[piece_to_where.to_sym].color} #{gb_arg.board_hash[piece_to_where.to_sym].name}"
			gb_arg.board_hash[piece_to_where.to_sym] = gb_arg.board_hash[piece_to_move.to_sym]
			gb_arg.board_hash[piece_to_where.to_sym].current_local = piece_to_where
			gb_arg.board_hash[piece_to_move.to_sym] = "*"
		else
			puts "Please select a valid attack move for the #{self.color} #{self.name}"
		end
	end
end