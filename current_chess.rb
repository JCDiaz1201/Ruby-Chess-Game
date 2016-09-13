class GameBoardSetup
	attr_accessor :board_hash

	def initialize

		@board_hash = {
			:a1 => "", :a2 => "", :a3 => "", :a4 => "", :a5 => "",
			:a6 => "", :a7 => "",:a8 => "", :b1 => "", :b2 => "",
			:b3 => "", :b4 => "", :b5 => "", :b6 => "", :b7 => "",
			:b8 => "", :c1 => "", :c2 => "", :c3 => "", :c4 => "",
			:c5 => "", :c6 => "", :c7 => "", :c8 => "",:d1 => "",
			:d2 => "", :d3 => "", :d4 => "", :d5 => "", :d6 => "",
			:d7 => "", :d8 => "", :e1 => "", :e2 => "", :e3 => "",
			:e4 => "", :e5 => "", :e6 => "", :e7 => "", :e8 => "",
			:f1 => "", :f2 => "", :f3 => "", :f4 => "", :f5 => "",
			:f6 => "", :f7 => "", :f8 => "", :g1 => "", :g2 => "",
			:g3 => "", :g4 => "", :g5 => "", :g6 => "", :g7 => "",
			:g8 => "", :h1 => "", :h2 => "", :h3 => "", :h4 => "", 
			:h5 => "", :h6 => "", :h7 => "", :h8 => ""
		}

	end
end





class Movement
	attr_accessor :game_board
	def initialize
		@game_board = GameBoardSetup.new
	end

	def starting_spot #trying to display key here for testing purposes
		puts "Please enter a key you would like to amend:"
		board_pos = gets.chomp!
#		puts "Please enter a value you would like to enter:"
#		user_input = gets.chomp!
		puts self.game_board.board_hash[board_pos.to_sym]
#		self.game_board.board_hash[board_pos] = user_input
	end

	def display_board					
		self.game_board.board_hash.each {|v| puts "#{v}"}
	end

end

test1 = Movement.new
test1.starting_spot
test1.display_board



