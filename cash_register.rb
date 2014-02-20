require 'kata'

kata "CashRegister" do
  requirement "Create a CashRegister class that is initialized with an Array of Integers" do
    detail "Each integer in the array represents the value of a type of coin in the cash register"
    detail "If no argument is provided to new, the cash register should default to 25, 10, 5 and 1 cent pieces"
    detail "The cash register should throw an error if it initialized with an argument that is not an array of integers"
    example "CashRegister.new([25,10,5,1])"
  end

  context "Make Change Method" do
    requirement %q{Create a make_change() method that takes an positive integer as an argument and returns a hash showing the minimum number of each coins required which sum to that number.} do
      detail "If a non integer argument is passed in, make_change() should throw an error."
      detail "The hash should have an entry for every coin in the cash register."
      detail "If a coin is not used, it's value should be zero."
      example "CashRegister.new().make_change(123) evaluates to: {'25' => 4, '10' => 2, '5' => 0, '1' => 3}"
      example "CashRegister.new([10,7,1]).make_change(14) evaluates to: {'10' => 0, '7' => 2, '1' => 0}"
    end
  end
end
