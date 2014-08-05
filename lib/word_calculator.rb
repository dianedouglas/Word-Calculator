def calculate(sentence)
  operands = []
  operators = []
  prev_is_operand = false

  sentence.split(" ").each do |word|
    if (prev_is_operand)
      operators << word
      prev_is_operand = false
    end

    #if first letter contains a number
    if ((/[0-9]/ =~ word.split("")[0]) == 0)
      operands << word.to_i
      prev_is_operand = true
    end

  end

  if operators[0] == 'plus'
    answer = operands[0] + operands[1]
  elsif(operators[0] == 'minus')
    answer = operands[0] - operands[1]
  elsif(operators[0] == 'times')
    answer = operands[0] * operands[1]
  end
  
  answer
end

 puts calculate('What is 5 times 3?')
