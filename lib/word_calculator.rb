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
      operands << word.to_f
      prev_is_operand = true
    end

  end

  if operators[0] == 'plus'
    answer = operands[0] + operands[1]
  elsif(operators[0] == 'minus')
    answer = operands[0] - operands[1]
  elsif(operators[0] == 'times')
    answer = operands[0] * operands[1]
  elsif(operators[0] == 'divided')
    answer = operands[0] / operands[1]
  end

  #all math done in floats, then strip off unneeded decimal places, converts to string.
  answer = ("%g" % ("%f" % answer))

  if(answer.include?("."))
    answer = answer.to_f
  else
    answer = answer.to_i
  end
  answer
end

