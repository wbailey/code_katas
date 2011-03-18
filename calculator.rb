require 'kata'

kata "Calculator" do
  requirement "Create a calculator that is initialized with a string expression" do
    example %q{The expression is of the form digits separated by commas: "1,2"}
    example "The expression is accessed by a method named expr"
    example "The expression can be reset for evaluation at any time without re-initializing"
  end

  requirement "create an add method that sums the expression" do
    example %q{The string can contain 0, 1 or 2 numbers for example "", "1", "1,2"}
    example "The method will return the sum of the digits"
    example "Then empty string will return 0"
  end

  requirement "Allow the expression to contain an unknown amount of numbers" do
    example %q{"1,2,3" computes to 6}
    example %q{"1,2,5,8" computes to 16}
  end

  requirement "Allow the expression to handle new lines between numbers" do
    example %q{"1\n2\n3" computes to 6}
    example %q{"2,3\n4" computes to 9}
    example %q{Consecutive use of delimeters ("1,\n2") should raise an exception}
  end

  requirement %q{Calling add with a negative number will give an exception} do
    example %q{The exception should tell the user "negatives not allowed"}
    example "The exception will list the negative number that was in the string"
    example "The exception should list all negatives if there is more than one"
  end

  requirement "Create a diff method that computes the consecutive differences" do
    example %q{"3,2,1" computes to 0}
    example %q{"5,4\n3,2\n1 computes to -5}
  end

  requirement "The diff methods should raise the same exceptions as the add method" do
    example "consecutive delimiters"
    example "negative numbers"
  end

  requirement "Allow the add method to accept a different delimiter" do
    example %q{The line of the string will contain "//[delimeter]\n...}
    example "This line is optional and all previous tests should pass"
    example %q{"//[;]\n1;2" computes to 3}
    example %q{"1;2" should raise an exception}
  end

  requirement "Allow the diff method to accept a different delimiter like add" do
    example %q{//[;]\n2;1 computes to 1}
  end

  requirement "Allow the add/diff methods to handle multiple different delimeters" do
    example %q{multiple delimeters can be specified using "//[delimeter]...[delimeter]\n...}
    example %q{"//[*][;]\n1*2;3" computes to 6}
    example %q{"//[*][;][#]\n5*4;3#2" computes to -4}
    example %q{"//[#][;][*]\n1*2#3;4,5\n6" computes to 21}
  end
end
