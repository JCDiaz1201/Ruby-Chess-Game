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

class Pawn
	attr_accessor :name, :value, :current_local, :color, :piece_display

	def initialize(current_local, color)
		@name = "Pawn"
		@value = 1
		@current_local = current_local
		@color = color
		@piece_display = piece_display

		if color == "Black"
			@piece_display = "\u265F"
		else
			@piece_display = "\u2659"
		end
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

	def setup(piece_to_where)
		dcstr_beg_local = current_local.split("")
		dcstr_end_local = piece_to_where.split("")
		@beg_letter, @beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
		@end_letter, @end_number = dcstr_end_local[0], dcstr_end_local[1]
	end

	def regular_move(piece_to_where, gb_arg, piece_to_move)
		if @color == "Black"
			move = 1
		else
			move = -1
		end
		setup(piece_to_where)
		if @beg_letter == @end_letter && @end_number.to_i == @beg_number.to_i + move
			gb_arg.board_hash[piece_to_where.to_sym] = gb_arg.board_hash[piece_to_move.to_sym]
			gb_arg.board_hash[piece_to_where.to_sym].current_local = piece_to_where
			gb_arg.board_hash[piece_to_move.to_sym] = "*"
		else
			puts "Please select a valid move for the #{self.color} #{self.name}"
		end
	end

	def kill_move(piece_to_where, gb_arg, piece_to_move)
		if @color == "Black"
			move = 1
		else
			move = -1
		end
		setup(piece_to_where)
		if (@beg_letter.ord - @end_letter.ord).abs == 1 && (@beg_number.to_i + move == @end_number.to_i) && (self.color != gb_arg.board_hash[piece_to_where.to_sym].color)
			puts "#{self.color} #{self.name} takes #{gb_arg.board_hash[piece_to_where.to_sym].color} #{gb_arg.board_hash[piece_to_where.to_sym].name}"
			gb_arg.board_hash[piece_to_where.to_sym] = gb_arg.board_hash[piece_to_move.to_sym]
			gb_arg.board_hash[piece_to_where.to_sym].current_local = piece_to_where
			gb_arg.board_hash[piece_to_move.to_sym] = "*"
		else
			puts "Please select a valid attack move for the #{self.color} #{self.name}"
		end
	end
end


