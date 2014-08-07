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

  # for(int i = 0; i < operators.length; i += 1){

  i = 0
  is_first_operation = true
  answer = 0.0
  operators.each do |operator|

    # if operator == 'plus'
    #   answer = operands[i] + operands[i + 1]
    # elsif(operator == 'minus')
    #   answer = operands[i] - operands[i + 1]
    # elsif(operator == 'times')
    #   answer = operands[i] * operands[i + 1]
    # elsif(operator == 'divided')
    #   answer = operands[i] / operands[i + 1]
    # els
    if(operator == 'to')
      if is_first_operation == true
        is_first_operation = false
        answer = operands[i] ** operands[i + 1]
      else
        answer = answer ** operands[i + 1]
      end
    elsif(operator == 'times' || operator == 'divided')
      if is_first_operation == true
        is_first_operation = false
        if operator == 'times'
          answer = operands[i] * operands[i + 1]
        elsif operator == 'divided'
          answer = operands[i] / operands[i + 1]       
        end   
      else
        if operator == 'times'
          answer *= operands[i + 1]
        elsif operator == 'divided'
          answer /= operands[i + 1]
        end           
      end
    end

    i += 1
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

