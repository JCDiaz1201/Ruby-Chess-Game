class Queen
	attr_accessor :name, :value, :current_local, :color, :piece_display

	def initialize(current_local, color)
		@name = "Queen"
		@value = 9
		@current_local = current_local
		@color = color
		@piece_display = piece_display

		if color == "Black"
			piece_display = "\u265B"
		else
			piece_display = "\u2655"
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
		
		if (beg_number.to_i < end_number.to_i) && (beg_letter.ord == end_letter.ord) # column movement north
			puts "column movement north"
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

		elsif ((beg_number.to_i > end_number.to_i) && (beg_letter.ord < end_letter.ord)) #movement northeast
			puts "movement northeast"
			traverse_num = (beg_number.to_i - end_number.to_i).abs
			traverse_num2 = (beg_letter.ord - end_letter.ord).abs
			return unless traverse_num == traverse_num2
			if traverse_num >= 2
				count = 1
				new_number = beg_number.to_i
				new_letter = (beg_letter.ord).to_i
				while traverse_num > count
					count += 1
					new_number = new_number - 1
					new_letter = new_letter + 1
					move_array.push(gb_arg.board_hash[(new_letter.chr + new_number.to_s).to_sym])
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

		elsif ((beg_letter.ord < end_letter.ord) && (beg_number.to_i == end_number.to_i)) # row movement east
			puts "row movement east"
			traverse_num = ((beg_letter.ord).to_i - (end_letter.ord).to_i).abs 
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

		elsif ((beg_number.to_i < end_number.to_i) && (beg_letter.ord < end_letter.ord)) #movement southeast
			puts "movement southeast"
			traverse_num = (beg_number.to_i - end_number.to_i).abs
			traverse_num2 = (beg_letter.ord - end_letter.ord).abs
			return unless traverse_num == traverse_num2
			if traverse_num >= 2
				count = 1
				new_number = beg_number.to_i
				new_letter = (beg_letter.ord).to_i
				while traverse_num > count
					count += 1
					new_number = new_number + 1
					new_letter = new_letter + 1
					move_array.push(gb_arg.board_hash[(new_letter.chr + new_number.to_s).to_sym])
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

		elsif (beg_number.to_i > end_number.to_i) && (beg_letter.ord == end_letter.ord) #column movement south
			puts "column movement south"
			traverse_num = (beg_number.to_i - end_number.to_i).abs 
			if traverse_num >= 2
				count = 1 
				new_number = beg_number.to_i
				while traverse_num > count 
					count += 1
					new_number = new_number - 1
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

		elsif ((beg_number.to_i < end_number.to_i) && (beg_letter.ord > end_letter.ord)) #movement southwest
			puts "movement southwest"
			traverse_num = (beg_number.to_i - end_number.to_i).abs
			traverse_num2 = (beg_letter.ord - end_letter.ord).abs
			return unless traverse_num == traverse_num2
			if traverse_num >= 2
				count = 1
				new_number = beg_number.to_i
				new_letter = (beg_letter.ord).to_i
				while traverse_num > count
					count += 1
					new_number = new_number + 1
					new_letter = new_letter - 1
					move_array.push(gb_arg.board_hash[(new_letter.chr + new_number.to_s).to_sym])
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

		elsif ((beg_letter.ord > end_letter.ord) && (beg_number.to_i == end_number.to_i)) # row movement west
			puts "row movement west"
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

		elsif ((beg_number.to_i > end_number.to_i) && (beg_letter.ord > end_letter.ord)) #movement northwest
			puts "movement northwest"
			traverse_num = (beg_number.to_i - end_number.to_i).abs
			traverse_num2 = (beg_letter.ord - end_letter.ord).abs
			return unless traverse_num == traverse_num2

			if traverse_num >= 2
				count = 1
				new_number = beg_number.to_i
				new_letter = (beg_letter.ord).to_i
				while traverse_num > count
					count += 1
					new_number = new_number - 1
					new_letter = new_letter - 1
					move_array.push(gb_arg.board_hash[(new_letter.chr + new_number.to_s).to_sym])
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

		else
			puts "Invalid move for the #{self.name} #{self.color}"
		end
	end

	def regular_move(piece_to_where, gb_arg, piece_to_move)
		gb_arg.board_hash[piece_to_where.to_sym] = gb_arg.board_hash[piece_to_move.to_sym]
		gb_arg.board_hash[piece_to_where.to_sym].current_local = piece_to_where
		gb_arg.board_hash[piece_to_move.to_sym] = "*"
	end

	def kill_move_test(piece_to_where, gb_arg, piece_to_move)
		error_test = false
		kill_array = []
		dcstr_beg_local = current_local.split("")
		dcstr_end_local = piece_to_where.split("")
		beg_letter, beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
		end_letter, end_number = dcstr_end_local[0], dcstr_end_local[1]
		
		if (beg_number.to_i < end_number.to_i) && (beg_letter.ord == end_letter.ord) # column movement north
			puts "column movement north"
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

		elsif ((beg_number.to_i > end_number.to_i) && (beg_letter.ord < end_letter.ord)) #movement northeast
			puts "movement northeast"
			traverse_num = (beg_number.to_i - end_number.to_i).abs
			traverse_num2 = (beg_letter.ord - end_letter.ord).abs
			return unless traverse_num == traverse_num2
			if traverse_num >= 2
				count = 1
				new_number = beg_number.to_i
				new_letter = (beg_letter.ord).to_i
				while traverse_num > count
					count += 1
					new_number = new_number - 1
					new_letter = new_letter + 1
					kill_array.push(gb_arg.board_hash[(new_letter.chr + new_number.to_s).to_sym])
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

		elsif ((beg_letter.ord < end_letter.ord) && (beg_number.to_i == end_number.to_i)) # row movement east
			puts "row movement east"
			traverse_num = ((beg_letter.ord).to_i - (end_letter.ord).to_i).abs 
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

		elsif ((beg_number.to_i < end_number.to_i) && (beg_letter.ord < end_letter.ord)) #movement southeast
			puts "movement southeast"
			traverse_num = (beg_number.to_i - end_number.to_i).abs
			traverse_num2 = (beg_letter.ord - end_letter.ord).abs
			return unless traverse_num == traverse_num2
			if traverse_num >= 2
				count = 1
				new_number = beg_number.to_i
				new_letter = (beg_letter.ord).to_i
				while traverse_num > count
					count += 1
					new_number = new_number + 1
					new_letter = new_letter + 1
					kill_array.push(gb_arg.board_hash[(new_letter.chr + new_number.to_s).to_sym])
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

		elsif (beg_number.to_i > end_number.to_i) && (beg_letter.ord == end_letter.ord) #column movement south
			puts "column movement south"
			traverse_num = (beg_number.to_i - end_number.to_i).abs 
			if traverse_num >= 2
				count = 1 
				new_number = beg_number.to_i
				while traverse_num > count 
					count += 1
					new_number = new_number - 1
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

		elsif ((beg_number.to_i < end_number.to_i) && (beg_letter.ord > end_letter.ord)) #movement southwest
			puts "movement southwest"
			traverse_num = (beg_number.to_i - end_number.to_i).abs
			traverse_num2 = (beg_letter.ord - end_letter.ord).abs
			return unless traverse_num == traverse_num2
			if traverse_num >= 2
				count = 1
				new_number = beg_number.to_i
				new_letter = (beg_letter.ord).to_i
				while traverse_num > count
					count += 1
					new_number = new_number + 1
					new_letter = new_letter - 1
					kill_array.push(gb_arg.board_hash[(new_letter.chr + new_number.to_s).to_sym])
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

		elsif ((beg_letter.ord > end_letter.ord) && (beg_number.to_i == end_number.to_i)) # row movement west
			puts "row movement west"
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

		elsif ((beg_number.to_i > end_number.to_i) && (beg_letter.ord > end_letter.ord)) #movement northwest
			puts "movement northwest"
			traverse_num = (beg_number.to_i - end_number.to_i).abs
			traverse_num2 = (beg_letter.ord - end_letter.ord).abs
			return unless traverse_num == traverse_num2

			if traverse_num >= 2
				count = 1
				new_number = beg_number.to_i
				new_letter = (beg_letter.ord).to_i
				while traverse_num > count
					count += 1
					new_number = new_number - 1
					new_letter = new_letter - 1
					kill_array.push(gb_arg.board_hash[(new_letter.chr + new_number.to_s).to_sym])
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

		else
			puts "Invalid move for the #{self.name} #{self.color}"
		end
	end

	def kill_move(piece_to_where, gb_arg, piece_to_move)
		if self.color != gb_arg.board_hash[piece_to_where.to_sym].color
			puts "#{self.color} #{self.name} takes #{gb_arg.board_hash[piece_to_where.to_sym].color} #{gb_arg.board_hash[piece_to_where.to_sym].name}"
			gb_arg.board_hash[piece_to_where.to_sym] = gb_arg.board_hash[piece_to_move.to_sym]
			gb_arg.board_hash[piece_to_where.to_sym].current_local = piece_to_where
			gb_arg.board_hash[piece_to_move.to_sym] = "*"
		else
			puts "Please select a valid attack move for the #{self.color} #{self.name}"
		end
	end
end








