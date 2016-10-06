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

class Rook
	attr_accessor :name, :value, :current_local, :color, :piece_display

	def initialize(current_local, color)
		@name = "Rook"
		@value = 5
		@current_local = current_local
		@color = color
		@piece_display = piece_display

		if color == "Black"
			@piece_display = "\u265C"
		else
			@piece_display = "\u2656"
		end


	end

	def allowed_moves(piece_to_where, gb_arg, kill_test, piece_to_move)
		if kill_test == true 
			kill_move_test(piece_to_where, gb_arg, piece_to_move)
		elsif kill_test == false
			regular_move_test(piece_to_where, gb_arg, piece_to_move)
		else
			puts "An error occured, please retry your move again... "
		end
	end

	def regular_move_test(piece_to_where, gb_arg, piece_to_move)
		error_test = false
		move_array = []
		dcstr_beg_local = current_local.split("")
		dcstr_end_local = piece_to_where.split("")
		beg_letter, beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
		end_letter, end_number = dcstr_end_local[0], dcstr_end_local[1]

		if ((beg_number.to_i > end_number.to_i) && (beg_letter.to_i == end_letter.to_i)) #check to see if the move requests is a column move downward
			traverse_num = (beg_number.to_i - end_number.to_i).abs #check to see if the move is equal to or larger than 2
			if traverse_num >= 2
				count = 1 # needs to be set so the iterator doesn't check the place where the rook is to move
				new_number = beg_number.to_i
				while traverse_num > count 
					count += 1
					new_number = new_number - 1
					move_array.push(gb_arg.board_hash[(beg_letter + new_number.to_s).to_sym]) #convert the movements to symbols from the hash, then push to the array
				end
				move_array.each do |x|
					if x != "*"
						puts "error, a piece is in front."
						error_test = true
						return
					else
						error_test = false
					end
				end
				if error_test == false
					regular_move(piece_to_where, gb_arg, piece_to_move)
				end
			else
				regular_move(piece_to_where, gb_arg, piece_to_move)
			end

		elsif (beg_number.to_i < end_number.to_i) && (beg_letter.to_i == end_letter.to_i) # Column Movement
			traverse_num = (beg_number.to_i - end_number.to_i).abs
			if traverse_num >= 2
				count = 1
				new_number = beg_number.to_i
				while traverse_num > count
					count += 1
					new_number = new_number + 1
					move_array.push(gb_arg.board_hash[(beg_letter + new_number.to_s).to_sym])
				end
				move_array.each do |x|
					if x != "*"
						puts "error, a piece is in front."
						error_test = true
						return
					else
						error_test = false
					end
				end
				if error_test == false
					regular_move(piece_to_where, gb_arg, piece_to_move)
				end
			else
				regular_move(piece_to_where, gb_arg, piece_to_move)
			end

		elsif (beg_letter.ord).to_i > (end_letter.ord).to_i # Row movement, decreasing
			traverse_num = (beg_letter.ord - end_letter.ord).abs
			if traverse_num >= 2	
				count = 1
				new_letter = (beg_letter.ord).to_i
				while traverse_num > count
					count += 1
					new_letter = new_letter - 1
					move_array.push(gb_arg.board_hash[(new_letter.chr + end_number.to_s).to_sym])
				end
				move_array.each do |x|
					if x != "*"
						puts "Error, there is a piece in front."
						error_test = true
						return
					else
						error_test = false
					end
				end
				if error_test == false
					regular_move(piece_to_where, gb_arg, piece_to_move)
				end
			else 
				regular_move(piece_to_where, gb_arg, piece_to_move)
			end

		elsif (beg_letter.ord).to_i < (end_letter.ord).to_i	
			traverse_num = ((beg_letter.ord).to_i - (end_letter.ord).to_i).abs # Row movement, increasing
			if traverse_num >= 2	
				count = 1
				new_letter = (beg_letter.ord).to_i
				while traverse_num > count
					count += 1
					new_letter = new_letter + 1
					move_array.push(gb_arg.board_hash[(new_letter.chr + end_number.to_s).to_sym])
				end
				move_array.each do |x|
					if x != "*"
						puts "Error, there is a piece in front."
						error_test = true
						return
					else
						error_test = false
					end
				end
				if error_test == false
					regular_move(piece_to_where, gb_arg, piece_to_move)
				end
			else 
				regular_move(piece_to_where, gb_arg, piece_to_move)
			end

		else
			puts "Something went wrong..."
		end
	end

	def regular_move(piece_to_where, gb_arg, piece_to_move)
		dcstr_beg_local = current_local.split("")
		dcstr_end_local = piece_to_where.split("")
		beg_letter, beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
		end_letter, end_number = dcstr_end_local[0], dcstr_end_local[1]

		if (beg_letter == end_letter) && ((end_number.to_i >= 1) && (end_number.to_i <= 8)) || ((end_number.to_i == beg_number.to_i) && ((end_letter.ord) >= 97 && (end_letter.ord <= 104)))
				gb_arg.board_hash[piece_to_where.to_sym] = gb_arg.board_hash[piece_to_move.to_sym]
				gb_arg.board_hash[piece_to_where.to_sym].current_local = piece_to_where
				gb_arg.board_hash[piece_to_move.to_sym] = "*"
		else
			puts "Please select a valid move for the #{self.color} #{self.name}"
		end
	end

	def kill_move_test(piece_to_where, gb_arg, piece_to_move)
		kill_array = []
		error_test = false
		kill_array = []
		dcstr_beg_local = current_local.split("")
		dcstr_end_local = piece_to_where.split("")
		beg_letter, beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
		end_letter, end_number = dcstr_end_local[0], dcstr_end_local[1]

		if ((beg_number.to_i > end_number.to_i) && (beg_letter.to_i == end_letter.to_i)) #check to see if the move reuqestes is a column move downward
			traverse_num = (beg_number.to_i - end_number.to_i).abs #check to see if the move is equal to or larger than 2
			if traverse_num >= 2
				count = 1 # needs to be set so the iterator doesn't check the place where the rook is to move
				new_number = beg_number.to_i
				while traverse_num > count 
					count += 1
					new_number = new_number - 1
					kill_array.push(gb_arg.board_hash[(beg_letter + new_number.to_s).to_sym]) #convert the movements to symbols from the hash, then push to the array
				end
				kill_array.each do |x| #check the array
					if x != "*"
						puts "error, a piece is in front." #if there is anything between beg - end throw an error
						error_test = true
						return
					else
						error_test = false
					end
				end
				if error_test == false
					kill_move(piece_to_where, gb_arg, piece_to_move)
				end
			else
				kill_move(piece_to_where, gb_arg, piece_to_move)
			end

		elsif (beg_number.to_i < end_number.to_i) && (beg_letter.to_i == end_letter.to_i) # Column Movement
			traverse_num = (beg_number.to_i - end_number.to_i).abs
			if traverse_num >= 2
				count = 1
				new_number = beg_number.to_i
				while traverse_num > count
					count += 1
					new_number = new_number + 1
					kill_array.push(gb_arg.board_hash[(beg_letter + new_number.to_s).to_sym])
				end
				kill_array.each do |x|
					if x != "*"
						puts "error, a piece is in front."
						error_test = true
						return
					else
						error_test = false
					end
				end
				if error_test == false
					kill_move(piece_to_where, gb_arg, piece_to_move)
				end
			else
				kill_move(piece_to_where, gb_arg, piece_to_move)
			end

		elsif (beg_letter.ord).to_i > (end_letter.ord).to_i # Row movement, decreasing
			traverse_num = (beg_letter.ord - end_letter.ord).abs
			if traverse_num >= 2	
				count = 1
				new_letter = (beg_letter.ord).to_i
				while traverse_num > count
					count += 1
					new_letter = new_letter - 1
					kill_array.push(gb_arg.board_hash[(new_letter.chr + end_number.to_s).to_sym])
				end
				kill_array.each do |x|
					if x != "*"
						puts "Error, there is a piece in front."
						error_test = true
						return
					else
						error_test = false
					end
				end
				if error_test == false
					kill_move(piece_to_where, gb_arg, piece_to_move)
				end
			else 
				kill_move(piece_to_where, gb_arg, piece_to_move)
			end

		elsif (beg_letter.ord).to_i < (end_letter.ord).to_i
			traverse_num = ((beg_letter.ord).to_i - (end_letter.ord).to_i).abs # Row movement, increasing
			if traverse_num >= 2	
				count = 1
				new_letter = (beg_letter.ord).to_i
				while traverse_num > count
					count += 1
					new_letter = new_letter + 1
					kill_array.push(gb_arg.board_hash[(new_letter.chr + end_number.to_s).to_sym])
				end
				kill_array.each do |x|
					if x != "*"
						puts "Error, there is a piece in front."
						error_test = true
						return
					else
						error_test = false
					end
				end
				if error_test == false
					kill_move(piece_to_where, gb_arg, piece_to_move)
				end
			else 
				kill_move(piece_to_where, gb_arg, piece_to_move)
			end

		else
			puts "Something went wrong..."
		end
	end

	def kill_move(piece_to_where, gb_arg, piece_to_move)
		dcstr_beg_local = current_local.split("")
		dcstr_end_local = piece_to_where.split("")
		beg_letter, beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
		end_letter, end_number = dcstr_end_local[0], dcstr_end_local[1]


		if (beg_letter == end_letter) && ((end_number.to_i >= 1) && (end_number.to_i <= 8) && (self.color != gb_arg.board_hash[piece_to_where.to_sym].color)) || ((end_number.to_i == beg_number.to_i) && ((end_letter.ord) >= 97 && (end_letter.ord <= 104)) && (self.color != gb_arg.board_hash[piece_to_where.to_sym].color))
			puts "#{self.color} #{self.name} takes #{gb_arg.board_hash[piece_to_where.to_sym].color} #{gb_arg.board_hash[piece_to_where.to_sym].name}"
			gb_arg.board_hash[piece_to_where.to_sym] = gb_arg.board_hash[piece_to_move.to_sym]
			gb_arg.board_hash[piece_to_where.to_sym].current_local = piece_to_where
			gb_arg.board_hash[piece_to_move.to_sym] = "*"
		else
			puts "Please select a valid attack move for the #{self.color} #{self.name}"
		end
	end
end


