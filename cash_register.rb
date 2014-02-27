require 'kata'

kata "CashRegister" do
  context 'Create a Change class' do

    requirement 'It is a sub-class of Hash.' do
      detail 'It\'s keys represent coins.'
      detail 'It\'s values represent how many of each coin there are.'
    end

    requirement 'Change.new' do
      detail 'The Change class is initialized with an array of Integers.'
      detail 'It throws an error if the argument is not an array.'
      detail 'It throws an error if each element in the argument array is not an Integer.'
      detail 'Each element of the array argument is a key in the Change instance.'
      detail 'All values are initialized to zero.'
      example 'Change.new([10,5,1]) #=> {10 => 0, 5 => 0, 1 => 0}'
    end

    requirement 'Create an add() method.' do
      detail 'It takes an integer representing a coin as an argument.'
      detail 'It throws an error if the coin is not a key.'
      detail 'It does not modify the original object.'
      detail 'It returns a new object with the count of the given coin incremented.'
      example 'Change.new([10,5,1]).add(5) #=> {10 => 0, 5 => 1, 1 => 0}'
    end

    requirement 'Create a count_coins() method.' do
      detail 'It returns the number of coins in the Change object.'
      example 'Change.new([5]).add(5).add(5).count_coins #=> 2'
    end

    requirement 'Create a value() method.' do
      detail 'It returns the monetary value of the Change object.'
      example 'Change.new([5]).add(5).add(5).value #=> 10'
    end
  end

  context "Create a CashRegister class." do

    requirement 'CashRegister.new' do
      detail "It that is initialized with an Array of Integers."
      detail "Each integer represents the value of a type of coin in the cash register."
      detail "You can assume that there are an infinite number of coins in the cash register."
      detail "The cash register should default to 25, 10, 5 and 1 cent pieces."
      detail 'It should validate that the argument is an Array.'
      detail 'It should validate that each element of the argument array is an Integer.'
      example "CashRegister.new([25,10,5,1])"
    end

    requirement %q{Create a make_change() method.} do
      detail "It takes an positive integer as an argument."
      detail "If a non integer argument is passed in, make_change() should throw an error."
      detail "It returns a Change object showing the smallest number of coins which sum to the argument."
      detail 'If there is no combination of coins that sum to the value, it should return nil.'
      example 'CashRegister.new().make_change(0) #=> nil'
      example 'CashRegister.new().make_change(5) #=> {25 => 0, 10 => 0, 5 => 1, 1 => 0}'
      example 'CashRegister.new().make_change(123) #=> {25 => 4, 10 => 2, 5 => 0, 1 => 3}'
      example 'CashRegister.new([10,7,1]).make_change(14) #=> {10 => 0, 7 => 2, 1 => 0}'
      example 'CashRegister.new([2,5,12,18,35,36]).make_change(67) #=> {2=>1, 5=>0, 12=>1, 18=>1, 35=>1, 36=>0}'
    end
  end
end
