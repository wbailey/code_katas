# frozen_string_literal: true

require 'kata'

# rubocop:disable Metrics/BlockLength
# rubocop:disable Metrics/LineLength
kata 'Calculator' do
  requirement 'Create a calculator service that has an expression resource' do
    detail "The expression is of the form digits separated by commas: '1,2'"
    detail 'The expression can be created, retrieved, updated and deleted'
    example 'GET http://localhost:3000/expression/1'
    example 'POST http://localhost:3000/expression/'
    example "  => Payload: {input: '1,2'}"
  end

  context 'Add Method' do
    requirement 'Create an add method that sums the specified string expression' do
      detail 'The method will return the sum of the digits'
      detail 'The expression can contain 0, 1 or 2 numbers'
      detail 'Then empty string will return 0'
      example 'POST /expression'
      example "  => Payload: {input: '1,2'}"
      example "  => Response: {id:1, input:'1,2'}"
      example 'GET /add/expression/1'
      example '  => Response: {id:1, sum:3}'
      example "'1' computes to 1"
      example "'1,2' computes to 3"
    end

    requirement 'Allow the expression to contain an unknown amount of numbers' do
      example "POST /expression => payload: {input: '1,2,3'}, Response: {id:2, input:'1,2,3'}"
      example "POST /expression => payload: {input: '1,2,5,8'}, Response: {id:3, input:'1,2,5,8'}"
      example 'GET /add/expression/2 => {sum: 6}'
      example 'GET /add/expression/3 => {sum: 16}'
    end
  end

  context 'Diff Method' do
    requirement 'Create a diff method that computes the consecutive differences' do
      detail 'The expression must contain at least 2 digits'
      example "'1,0' compues to 1"
      example "'3,2,1' computes to 0"
      example "'5,4,3,2,1 computes to -5"
      detail 'Expressions with less than 2 digits raise an exception'
      example "'' or '5'"
    end
  end

  context 'Prod Method' do
    requirement 'Create a prod method that computes the multiples in the expression' do
      detail 'The method will return the product of the numbers'
      example "'0' computes to 0"
      example "'2,1' computes to 2"
      example "'3,2,1' computes to 6"
    end
  end

  context 'Div Method' do
    requirement 'Create a div method that computes the consecutive divisions in the expression' do
      detail 'The method will return the final quotient of the numbers'
      detail 'it will raise an exception if the expression contains the number 0'
      example "'2,1' computes to 2"
      example "'3,2,1' computes to 1"
      example "'1,2,3' computes to 0"
    end
  end
end
# rubocop:enable Metrics/BlockLength
# rubocop:enable Metrics/LineLength
