require 'rspec'
require 'word_calculator'

describe('calculate') do
  
  it('adds two integers given in a sentence.') do
    calculate('What is 5 plus 3?').should(eq(8))
  end
end