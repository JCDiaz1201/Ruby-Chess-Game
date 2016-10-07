 
# here for visualization purposes
#
# :a1 :b1 :c1 :d1 :e1 :f1 :g1 :h1 #Black Side
# :a2 :b2Pawn.new("a2", "Black")2 :d2 :e2 :f2 :g2 :h2
# :a3 :b3 :c3 :d3 :e3 :f3 :g3 :h3
# :a4 :b4 :c4 :d4 :e4 :f4 :g4 :h4
# :a5 :b5 :c5 :d5 :e5 :f5 :g5 :h5
# :a6 :b6 :c6 :d6 :e6 :f6 :g6 :h6
# :a7 :b7 :c7 :d7 :e7 :f7 :g7 :h7
# :a8 :b8 :c8 :d8 :e8 :f8 :g8 :h8 #White Side
#



def initialize
	@board_hash = {
		:a1 => Rook.new("a1", "Black"), :b1 => Knight.new("b1", "Black"), :c1 => Bishop.new("c1", "Black"), :d1 => Queen.new("d1", "Black"), :e1 => King.new("e1", "Black"), :f1 => Bishop.new("f1", "Black"), :g1 => Knight.new("g1", "Black"), :h1 => Rook.new("h1", "Black"),
		:a2 => Pawn.new("a2", "Black"), :b2 => Pawn.new("b2", "Black"), :c2 => Pawn.new("c2", "Black"), :d2 => Pawn.new("d2", "Black"), :e2 => Pawn.new("e2", "Black"), :f2 => Pawn.new("f2", "Black"), :g2 => Pawn.new("g2", "Black"), :h2 => Pawn.new("h2", "Black"),
		:a3 => "*", :b3 => "*", :c3 => "*", :d3 => "*", :e3 => "*", :f3 => "*", :g3 => "*", :h3 => "*",
		:a4 => "*", :b4 => "*", :c4 => "*", :d4 => "*", :e4 => "*", :f4 => "*", :g4 => "*", :h4 => "*",
		:a5 => "*", :b5 => "*", :c5 => "*", :d5 => "*", :e5 => "*", :f5 => "*", :g5 => "*", :h5 => "*",
		:a6 => "*", :b6 => "*", :c6 => "*", :d6 => "*", :e6 => "*", :f6 => "*", :g6 => "*", :h6 => "*",
		:a7 => "*", :b7 => "*", :c7 => "*", :d7 => "*", :e7 => "*", :f7 => "*", :g7 => "*", :h7 => "*",
		:a8 => "*", :b8 => "*", :c8 => "*", :d8 => "*", :e8 => "*", :f8 => "*", :g8 => "*", :h8 => "*"
	}
end




















