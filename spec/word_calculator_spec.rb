require 'rspec'
require 'word_calculator'
require 'pry'


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

end