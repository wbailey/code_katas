require 'kata'

kata "Calculator" do
  requirement "Create a calculator that is initialized with a string expression" do
    detail %q{The expression is of the form digits separated by commas: "1,2"}
    detail "The expression is accessed by a method named expr"
    detail "The expression can be reset for evaluation at any time without re-initializing"
    example %q{Calculator.new "1,2"}
  end

  context "Add Method" do
    requirement "Create an add method that sums the string expression" do
      detail "The method will return the sum of the digits"
      detail "The expression can contain 0, 1 or 2 numbers"
      detail "Then empty string will return 0"
      example %q{"" sums to 0}
      example %q{"1" sums to 1}
      example %q{"1,2" sums to 3}
    end

    requirement "Allow the expression to contain an unknown amount of numbers" do
      example %q{"1,2,3" sums to 6}
      example %q{"1,2,5,8" sums to 16}
    end

    requirement "Allow the expression to handle new lines between numbers" do
      example %q{"1\n2\n3" sums to 6}
      example %q{"2,3\n4" sums to 9}
      detail %q{Consecutive use of delimeters should raise an exception}
      example %q{"1,\n2" or "1\n,2"}
    end

    requirement "Calling add with a negative number will give an exception" do
      detail %q{The exception should tell the user "negatives not allowed"}
      detail "The exception will list the negative number that was in the string"
      detail "The exception should list all negatives if there is more than one"
    end
  end

  context "Diff Method" do
    requirement "Create a diff method that computes the consecutive differences" do
      example %q{"3,2,1" sums to 0}
      example %q{"5,4\n3,2\n1 sums to -5}
    end

    requirement "The diff methods should raise the same exceptions as the add method" do
      detail "consecutive delimiters"
      detail "negative numbers"
    end
  end

  context "Define Custom Delimeters" do
    requirement "Allow the add method to accept a different delimiter" do
      detail %q{The line of the string will contain "//[delimeter]\n...}
      detail "This line is optional and all previous tests should pass"
      example %q{"//[;]\n1;2" sums to 3}
      detail %q{"1;2" should raise an exception}
    end

    requirement "Allow the diff method to accept a different delimiter like add" do
      example %q{//[;]\n2;1 sums to 1}
    end

    requirement "Allow the add/diff methods to handle multiple different delimeters" do
      example %q{multiple delimeters can be specified using "//[delimeter]...[delimeter]\n...}
      example %q{"//[*][;]\n1*2;3" sums to 6}
      example %q{"//[*][;][#]\n5*4;3#2" sums to -4}
      example %q{"//[#][;][*]\n1*2#3;4,5\n6" sums to 21}
    end
  end
end
