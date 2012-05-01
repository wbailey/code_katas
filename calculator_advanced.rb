require 'kata'

kata "CalculatorAdvanced" do
  context "Add Method" do
    requirement "Allow the expression to handle new lines between numbers" do
      example %q{"1\n2\n3" computes to 6}
      example %q{"2,3\n4" computes to 9}
      detail %q{Consecutive use of delimeters should raise an exception}
      example %q{"1,\n2" or "1\n,2"}
    end

    requirement "Calling method with a negative number will give an exception" do
      detail %q{The exception should tell the user "negatives not allowed"}
      detail "The exception will list the negative number that was in the string"
      detail "The exception should list all negatives if there is more than one"
    end
  end

  context "Diff and Product Method" do
    requirement "should raise the same exceptions as the add method" do
      detail "Consecutive Delimiters"
      detail "Negative Numbers"
    end
  end

  context "Define Custom Delimeters" do
    requirement "Allow the add method to accept a different delimiter" do
      detail %q{The line of the string will contain "//[delimeter]\n...}
      detail "This line is optional and all previous tests should pass"
      example %q{"//[;]\n1;2" computes to 3}
      detail %q{"1;2" should raise an exception}
    end

    requirement "Allow the diff method to accept a different delimiter like add" do
      example %q{//[;]\n2;1 computes to 1}
    end

    requirement "Allow the prod method to accept a different delimiter like add" do
      example %q{//[;]\n2;1 computes to 2}
    end

    requirement "Allow the div method to accept a different delimiter like add" do
      example %q{//[;]\n3;2 computes to 1}
    end

    requirement "Allow the add method to handle multiple different delimeters" do
      example %q{multiple delimeters can be specified using "//[delimeter]...[delimeter]\n...}
      example %q{"//[*][;]\n1*2;3" computes to 6}
      example %q{"//[*][;][#]\n5*4;3#2" computes to -4}
      example %q{"//[#][;][*]\n1*2#3;4,5\n6" computes to 21}
    end

    requirement 'Allow the diff method to handle multiple different delimeters' do
      example %q{"//[*][;]\n1*2;3" computes to -4}
    end

    requirement 'Allow the prod method to handle multiple different delimeters' do
      example %q{"//[*][;]\n1*2;3" computes to 6}
    end

    requirement 'Allow the div method to handle multiple different delimeters' do
      example %q{"//[*][;]\n1*2;3" computes to 0}
    end
  end
end
