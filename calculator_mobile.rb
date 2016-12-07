require 'kata'

kata 'Calculator' do
  context 'Display Button' do
    requirement 'Create a calculator app that is works with a string expression' do
      detail 'The expression is of the form digits separated by commas: 1,2'
      detail 'The expression is accessed by button named Display'
      detail 'Clicking on the Display button will show the expression on the screen'
      detail 'Changing the expression and pressing the [Return] key will update the display on the screen'
      example '
                 ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
                 ┃ ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ┃
                 ┃ ┃                        1,2┃ ┃
                 ┃ ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ ┃
                 ┃ ┏━━━━━━━┓                     ┃
                 ┃ ┃Display┃                     ┃
                 ┃ ┗━━━━━━━┛                     ┃
                 ┃                               ┃
                 ┃                               ┃
                 ┃                               ┃
                 ┃              1,2              ┃
                 ┃                               ┃
                 ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
      '
    end
    requirement 'Validate the expression is of the proper form' do
      detail 'Invalid expressions will be shown in the app'
      example '
                 ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
                 ┃ ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ┃
                 ┃ ┃                        a,b┃ ┃ 
                 ┃ ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ ┃
                 ┃ ┏━━━━━━━┓                     ┃
                 ┃ ┃Display┃                     ┃
                 ┃ ┗━━━━━━━┛                     ┃
                 ┃                               ┃
                 ┃                               ┃
                 ┃                               ┃
                 ┃      Invalid Expression       ┃
                 ┃                               ┃
                 ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
      '
    end
  end

  context 'Add Button' do
    requirement 'Create an Add button that sums the string expression' do
      detail 'The event will return the sum of the digits'
      detail 'The expression can contain 0, 1 or 2 numbers'
      detail 'Then empty string will return 0'
      example '
               ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
               ┃ ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ┃
               ┃ ┃                        1,2┃ ┃ 
               ┃ ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ ┃
               ┃ ┏━━━━━━━┓                     ┃
               ┃ ┃  Add  ┃                     ┃
               ┃ ┗━━━━━━━┛                     ┃
               ┃                               ┃
               ┃                               ┃
               ┃                               ┃
               ┃               3               ┃
               ┃                               ┃
               ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
      '
      example '"" computes to 0'
      example '"1" computes to 1'
      example '"1,2" computes to 3'
    end

    requirement 'Allow the expression to contain an unknown amount of numbers' do
      example '"1,2,3" computes to 6'
      example '"1,2,5,8" computes to 16'
      example '
               ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
               ┃ ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ┃
               ┃ ┃                      1,2,3┃ ┃ 
               ┃ ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ ┃
               ┃ ┏━━━━━━━┓                     ┃
               ┃ ┃  Add  ┃                     ┃
               ┃ ┗━━━━━━━┛                     ┃
               ┃                               ┃
               ┃                               ┃
               ┃                               ┃
               ┃               6               ┃
               ┃                               ┃
               ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
      '
    end
  end

  context 'Diff Method' do
    requirement 'Create an event that computes the consecutive differences' do
      detail 'The expression must contain at least 2 digits'
      detail 'Pressing the Sub button computes the differences while the Add button remains unchanged'
      example '
               ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
               ┃ ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ┃
               ┃ ┃                        2,1┃ ┃ 
               ┃ ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ ┃
               ┃ ┏━━━━━━━┓ ┏━━━━━━━┓           ┃
               ┃ ┃  Add  ┃ ┃  Sub  ┃           ┃
               ┃ ┗━━━━━━━┛ ┗━━━━━━━┛           ┃
               ┃                               ┃
               ┃                               ┃
               ┃                               ┃
               ┃               1               ┃
               ┃                               ┃
               ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
      '
      example '"1,0" compues to 1'
      example '"3,2,1" computes to 0'
      example '"5,4,3,2,1 computes to -5'
      detail 'Expressions with less than 2 digits raise an exception'
      example '"" or "5"'
    end
  end

  context 'Prod Method' do
    requirement 'Create a event that computes the product multiples in the expression' do
      detail 'Pressing the Mul button will return the product of the numbers'
      example '
               ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
               ┃ ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ┃
               ┃ ┃                        3,2┃ ┃ 
               ┃ ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ ┃
               ┃ ┏━━━━━━━┓ ┏━━━━━━━┓ ┏━━━━━━━┓ ┃
               ┃ ┃  Add  ┃ ┃  Sub  ┃ ┃  Mul  ┃ ┃
               ┃ ┗━━━━━━━┛ ┗━━━━━━━┛ ┗━━━━━━━┛ ┃
               ┃                               ┃
               ┃                               ┃
               ┃                               ┃
               ┃               6               ┃
               ┃                               ┃
               ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
      '
      example '"0" computes to 0'
      example '"2,1" computes to 2'
      example '"3,2,1" computes to 6'
    end
  end

  context 'Div Method' do
    requirement 'Create an event that computes the consecutive divisions in the expression' do
      detail 'The Div will return the final quotient of the numbers'
      detail 'Display an invalid expression message if it contains a zero'
      example '
               ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
               ┃ ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ┃
               ┃ ┃                                  3,2┃ ┃ 
               ┃ ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ ┃
               ┃ ┏━━━━━━━┓ ┏━━━━━━━┓ ┏━━━━━━━┓ ┏━━━━━━━┓ ┃
               ┃ ┃  Add  ┃ ┃  Sub  ┃ ┃  Mul  ┃ ┃  Div  ┃ ┃
               ┃ ┗━━━━━━━┛ ┗━━━━━━━┛ ┗━━━━━━━┛ ┗━━━━━━━┛ ┃
               ┃                                         ┃
               ┃                                         ┃
               ┃                                         ┃
               ┃                    6                    ┃
               ┃                                         ┃
               ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
      '
      example '"2,1" computes to 2'
      example '"3,2,1" computes to 1'
      example '"1,2,3" computes to 0'
      example '"0,1,2" computes to 0'
      example '"4,0,2" is an invalid expression'
    end
  end
end
