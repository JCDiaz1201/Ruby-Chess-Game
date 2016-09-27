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

class GameBoardSetup
	attr_accessor :board_hash

	def initialize
		@board_hash = {
			:a1 => "*", :a2 => "*", :a3 => "*", :a4 => "*", :a5 => "*", :a6 => "*", :a7 => "*", :a8 => "*",
			:b1 => "*", :b2 => "*", :b3 => "*", :b4 => "*", :b5 => "*", :b6 => "*", :b7 => Pawn.new("b7", "White"), :b8 => "*", 
			:c1 => "*", :c2 => "*", :c3 => "*", :c4 => "*", :c5 => "*", :c6 => "*", :c7 => "*", :c8 => "*", 
			:d1 => "*", :d2 => "*", :d3 => "*", :d4 => Rook.new("d4", "Black"), :d5 => "*", :d6 => "*", :d7 => Pawn.new("d7", "Black"), :d8 => Rook.new("d8", "White"),
			:e1 => "*", :e2 => "*", :e3 => "*", :e4 => Rook.new("g4", "Black"), :e5 => "*", :e6 => "*", :e7 => "*", :e8 => "*",
			:f1 => "*", :f2 => "*", :f3 => "*", :f4 => "*", :f5 => "*", :f6 => "*", :f7 => "*", :f8 => "*",
			:g1 => "*", :g2 => "*", :g3 => "*", :g4 => Rook.new("g4", "White"), :g5 => "*", :g6 => "*", :g7 => "*", :g8 => "*", 
			:h1 => Rook.new("h1", "Black"), :h2 => "*", :h3 => "*", :h4 => "*", :h5 => "*", :h6 => "*", :h7 => Pawn.new("h7", "Black"), :h8 => "*"
		}
	end
end

class Movement
	attr_accessor :game_board

	def initialize
		@game_board = GameBoardSetup.new
	end

	def starting_spot #trying to display key here for testing purposes
		self.game_board.board_hash.each {|v| puts "#{v}"}
		puts "Please select a unit on the board..."
		piece_to_move = gets.chomp!

		if self.game_board.board_hash[piece_to_move.to_sym] == "*"
			puts "Please select a valid piece that is in play"
			starting_spot
		else
			end_spot(piece_to_move)
		end
	end

	def end_spot(piece_to_move)
		puts "Where would you like to move the #{self.game_board.board_hash[piece_to_move.to_sym].color} #{self.game_board.board_hash[piece_to_move.to_sym].name}"
		puts "If you would like to select another piece to move please type in 'another' "
		piece_to_where = gets.chomp!

		if piece_to_where == "another"
			starting_spot
		elsif self.game_board.board_hash[piece_to_where.to_sym].nil?
			puts "Error, please select a valid spot on the board"
			end_spot(piece_to_move)
		elsif self.game_board.board_hash[piece_to_where.to_sym] != "*"
			kill_test = true
			self.game_board.board_hash[piece_to_move.to_sym].allowed_moves(piece_to_where, @game_board, kill_test, piece_to_move)
			starting_spot
		else
			kill_test = false
			self.game_board.board_hash[piece_to_move.to_sym].allowed_moves(piece_to_where, @game_board, kill_test, piece_to_move)
			starting_spot
		end
	end
end

class Pawn
	attr_accessor :name, :value, :current_local, :color

	def initialize(current_local, color)
		@name = "Pawn"
		@value = 1
		@current_local = current_local
		@color = color
	end

	def allowed_moves(piece_to_where, gb_arg, kill_test, piece_to_move)

		if kill_test == true && gb_arg.board_hash[piece_to_move.to_sym].name == "Pawn" #|| gb_arg.board_hash[piece_to_move.to_sym] == "King" || gb_arg.board_hash[piece_to_move.to_sym] == "Knight"
			kill_move(piece_to_where, gb_arg, piece_to_move)
		elsif kill_test == false && gb_arg.board_hash[piece_to_move.to_sym].name == "Pawn" #|| gb_arg.board_hash[piece_to_move.to_sym] == "King" || gb_arg.board_hash[piece_to_move.to_sym] == "Knight"
			regular_move(piece_to_where, gb_arg, piece_to_move)
		else
			puts "Error"
			exit
		end
	end

	private
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

		def kill_move(piece_to_where, gb_arg, piece_to_move)

			if @color == "Black"
				move = 1
			else
				move = -1
			end

			dcstr_beg_local = current_local.split("")
			dcstr_end_local = piece_to_where.split("")
			beg_letter, beg_number = dcstr_beg_local[0], dcstr_beg_local[1]
			end_letter, end_number = dcstr_end_local[0], dcstr_end_local[1]
		
			if (beg_letter.ord - end_letter.ord).abs == 1 && (beg_number.to_i + move == end_number.to_i) && (self.color != gb_arg.board_hash[piece_to_where.to_sym].color)
				puts "#{self.color} #{self.name} takes #{gb_arg.board_hash[piece_to_where.to_sym].color} #{gb_arg.board_hash[piece_to_where.to_sym].name}"
				gb_arg.board_hash[piece_to_where.to_sym] = gb_arg.board_hash[piece_to_move.to_sym]
				gb_arg.board_hash[piece_to_where.to_sym].current_local = piece_to_where
				gb_arg.board_hash[piece_to_move.to_sym] = "*"
			else
				puts "Please select a valid attack move for the #{self.color} #{self.name}"
			end
		end
end

class Rook
	attr_accessor :name, :value, :current_local, :color

	def initialize(current_local, color)
		@name = "Rook"
		@value = 5
		@current_local = current_local
		@color = color
	end

	def allowed_moves(piece_to_where, gb_arg, kill_test, piece_to_move)

		if kill_test == true && gb_arg.board_hash[piece_to_move.to_sym].name == "Rook" #|| gb_arg.board_hash[piece_to_move.to_sym] == "Bishop" || gb_arg.board_hash[piece_to_move.to_sym] == "Queen"
			kill_move_test(piece_to_where, gb_arg, piece_to_move)
		elsif kill_test == false && gb_arg.board_hash[piece_to_move.to_sym].name == "Rook" #|| (gb_arg.board_hash[piece_to_move.to_sym] == "Bishop" || gb_arg.board_hash[piece_to_move.to_sym] == "Queen"
			regular_move_test(piece_to_where, gb_arg, piece_to_move)
		else
			puts "Error"
			exit
		end
	end

	def traverse_checker(array_arg, error_test)
			array_arg.each do |x| #check the array
				if x != "*"
					puts "error, a piece is in front." #if there is anything between beg - end throw an error
					error_test = true
					return error_test
				end
			end
	end

	def regular_move_test(piece_to_where, gb_arg, piece_to_move)
		error_test = false
		move_array = []
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
					move_array.push(gb_arg.board_hash[(beg_letter + new_number.to_s).to_sym]) #convert the movements to symbols from the hash, then push to the array
				end
				traverse_checker(move_array, error_test)
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
				traverse_checker(move_array, error_test)
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
				traverse_checker(move_array, error_test)
				if error_test == false
					regular_move(piece_to_where, gb_arg, piece_to_move)
				end
			else 
				regular_move(piece_to_where, gb_arg, piece_to_move)
			end

		else
			traverse_num = ((beg_letter.ord).to_i - (end_letter.ord).to_i).abs # Row movement, increasing
			if traverse_num >= 2	
				count = 1
				new_letter = (beg_letter.ord).to_i
				while traverse_num > count
					count += 1
					new_letter = new_letter + 1
					move_array.push(gb_arg.board_hash[(new_letter.chr + end_number.to_s).to_sym])
				end
				traverse_checker(move_array, error_test)
				if error_test == false
					regular_move(piece_to_where, gb_arg, piece_to_move)
				end
			else 
				regular_move(piece_to_where, gb_arg, piece_to_move)
			end
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

class Knight
	attr_accessor :name, :value, :current_local, :color
end

class Bishop
	attr_accessor :name, :value, :current_local, :color
end

class Queen
	attr_accessor :name, :value, :current_local, :color
end

class King
	attr_accessor :name, :value, :current_local, :color
end

game = Movement.new
game.starting_spot







