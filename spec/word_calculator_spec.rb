require 'rspec'
require 'word_calculator'

describe('calculate') do

  it('adds two integers given in a sentence.') do
    expect(calculate('What is 5 plus 3?')).to eq 8
  end

  it('subtracts two integers given in a sentence.') do
    expect(calculate('What is 5 minus 3?')).to eq 2
  end

  it('subtracts two integers given in a sentence.') do
    expect(calculate('What is 5 times 3?')).to eq 15
  end

  it('subtracts two integers given in a sentence.') do
    expect(calculate('What is 5 divided by 2?')).to eq 2.5
  end

  it('raises the first integer to the second integer given in a sentence.') do
    expect(calculate('What is 2 to the 3rd power?')).to eq 8 
  end

  it('raises the first integer to the second integer when worded differently in a sentence.') do
    expect(calculate('What is 2 to the power of 3?')).to eq 8 
  end

  it('calculates three numbers in a sentence using the order of operations.') do
    expect(calculate('What is 2 to the power of 3 times 4')).to eq 32    
  end

  it('calculates a sentence involving negative numbers.') do 
    expect(calculate('What is minus 2 minus 3?')).to eq(-5)
  end

  it('calculates a sentence involving negative numbers.') do 
    expect(calculate('What is minus 2 plus negative 3?')).to eq(-5)
  end

  it('calculates a sentence involving negative numbers.') do 
    expect(calculate('What is minus 2 minus minus 3?')).to eq 1
  end

end

describe('calculate_sentences') do

  it('parses a single string with multiple sentences into an array of single sentence questions, then calls calculate to solve them.') do
    expect(calculate_sentences('What is 5 plus 3? What is 8 plus 3?')).to eq [8, 11]    
  end

  it('adds two integers given in a sentence.') do
    expect(calculate_sentences('What is 5 plus 3?')).to eq 8
  end

  it('subtracts two integers given in a sentence.') do
    expect(calculate_sentences('What is 5 minus 3?')).to eq 2
  end

  it('subtracts two integers given in a sentence.') do
    expect(calculate_sentences('What is 5 times 3?')).to eq 15
  end

  it('subtracts two integers given in a sentence.') do
    expect(calculate_sentences('What is 5 divided by 2?')).to eq 2.5
  end

  it('raises the first integer to the second integer given in a sentence.') do
    expect(calculate_sentences('What is 2 to the 3rd power?')).to eq 8 
  end

  it('raises the first integer to the second integer when worded differently in a sentence.') do
    expect(calculate_sentences('What is 2 to the power of 3?')).to eq 8 
  end

  it('calculates a sentence involving negative numbers.') do 
    expect(calculate('What is minus 2 plus negative 3?')).to eq(-5)
  end

  it('calculates a sentence involving negative numbers.') do 
    expect(calculate('What is minus 2 minus minus 3?')).to eq 1
  end

  it('filters out erroneous input which contains no numbers.') do 
    expect(calculate_sentences('What?')).to eq ['Please include at least two numbers.']
  end

  it('filters out erroneous input which is not a question.') do 
    expect(calculate_sentences('This is a 5.')).to eq ['Please ask a question.']
  end

  it('filters out erroneous input which is not a question and includes no numbers.') do 
    expect(calculate_sentences('This is a not an anything.')).to eq ['Please ask a question.', 'Please include at least two numbers.']
  end

  it('filters out erroneous input which meets all other requirements but only has one number.') do 
    expect(calculate_sentences('What is 5?')).to eq 'There has been an error with your input. Please make sure to use at least one number.'
  end

end

describe('check_for_errors') do 

  it('filters out erroneous input which is not a question.') do 
    expect(check_for_errors('This is a 5.')).to eq ['Please ask a question.']
  end

  it('filters out erroneous input which is not a question and includes no numbers.') do 
    expect(check_for_errors('This is a not an anything.')).to eq ['Please ask a question.', 'Please include at least two numbers.']
  end

  it('filters out erroneous shorthand input using "squared" or "cubed."') do 
    expect(check_for_errors('What is 2 squared?')).to eq ['When using powers, please phrase your question in the standard form of X to the power of Y or X to the Yth power.']
  end

  it('filters out erroneous input using "-" instead of minus or negative.') do 
    expect(check_for_errors('What is -2 plus 3?')).to eq ['I like words! Please use minus or negative instead of a dash.']
  end

  it('filters out erroneous input using "two" instead of 2.') do 
    expect(check_for_errors('What is Two plus 3?')).to eq ["You don't need to write out your numbers. Please just enter the digits inside your question."]
  end

end