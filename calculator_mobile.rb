require 'kata'

kata "Calculator" do
  requirement "Create a calculator app that is works with a string expression" do
    detail "The expression is of the form digits separated by commas: 1,2"
    detail "The expression is accessed by button named Display"
    detail "Clicking on the Display button will show the expression on the screen"
    detail "Changing the expression and pressing the [Enter] key will update the display on the screen"
    example %q{
               +-------------------------------+
               |                               |
               | __________________________1,2 |
               |                               |
               | +-------+                     |
               | |Display|                     |
               | +-------+                     |
               |                               |
               |                               |
               |                               |
               |              1,2              |
               |                               |
               +-------------------------------+
    }
  end

  context "Add Method" do
    requirement "Create an add method that sums the string expression" do
      detail "The method will return the sum of the digits"
      detail "The expression can contain 0, 1 or 2 numbers"
      detail "Then empty string will return 0"
      example %q{"" computes to 0}
      example %q{"1" computes to 1}
      example %q{"1,2" computes to 3}
    end

    requirement "Allow the expression to contain an unknown amount of numbers" do
      example %q{"1,2,3" computes to 6}
      example %q{"1,2,5,8" computes to 16}
    end
  end

  context "Diff Method" do
    requirement "Create a diff method that computes the consecutive differences" do
      detail "The expression must contain at least 2 digits"
      example %q{"1,0" compues to 1}
      example %q{"3,2,1" computes to 0}
      example %q{"5,4,3,2,1 computes to -5}
      detail "Expressions with less than 2 digits raise an exception"
      example %q{"" or "5"}
    end
  end

  context 'Prod Method' do
    requirement 'Create a prod method that computes the multiples in the expression' do
      detail 'The method will return the product of the numbers'
      example %q{"0" computes to 0}
      example %q{"2,1" computes to 2}
      example %q{"3,2,1" computes to 6}
    end
  end

  context 'Div Method' do
    requirement 'Create a div method that computes the consecutive divisions in the expression' do
      detail 'The method will return the final quotient of the numbers'
      detail 'it will raise an exception if the expression contains the number 0'
      example %q{"2,1" computes to 2}
      example %q{"3,2,1" computes to 1}
      example %q{"1,2,3" computes to 0}
    end
  end
end
