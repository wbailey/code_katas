require 'kata'

kata "ASCII Tic Tac Toe" do
  context "board definition" do
    requirement "There is a 3x3 playing grid" do
      detail "rows are identified as 1,2,3"
      detail "columns are identified as 1,2,3"
    end

    requirement "The are two pieces" do
      detail "'o' is allowed"
      detail "'x' is allowed"
    end
  end

  context "moves" do
    requirement "A player shall be able to make a move on the board" do
      detail "a move is defined by grid cooridinates"
      detail "each move must indicate the piece being moved"
      example "move(1, 1, 'x') defines placing the 'x' piece in the upper, left-most corner"
    end

    requirement "a move should be rejected when it is outside the grid" do
      example "move 4, 4, 'x'"
    end

    requirement "a move should be rejected when an invalid piece is played" do
      example "move 1, 1, 'z'"
    end

    requirement "a move should be rejected when a space is occupied" do
      example "move 1, 1, 'x'"
      example "move 1, 1, 'o' should be rejected"
    end
  end
end
