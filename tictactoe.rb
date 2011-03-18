require 'kata'

kata "ASCII Tic Tac Toe" do
  requirement "There is a 3x3 playing board" do
    detail "rows are identified as 1,2,3"
    detail "columns are identified as 1,2,3"
  end

  requirement "The are two pieces allowed on the board" do
    detail "'o' is an allowed piece"
    detail "'x' is an allowed piece"
  end
end
