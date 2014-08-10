def calculate_sentences(sentences)

  results = []
  word_index = 1

  while sentences.include? ("?")
    words = sentences.split(" ")

    words.each do |word| 

      if word.include? "?"
        current_sentence = words.slice!(0, word_index).join(" ")
        sentences = words.join(" ")
        results << calculate(current_sentence)
        word_index = 1
        break
      end
      word_index += 1

    end

  end

  if results.length == 1
    results[0] 
  else
    results
  end

end

def calculate(sentence)
  operands = []
  operators = []
  prev_is_operand = false
  index_operand = 0
  sentence = sentence.split(" ")

  sentence.each do |word|

    if (prev_is_operand)
      operators << word
      prev_is_operand = false
    end

    #if first letter contains a number
    if ((/[0-9]/ =~ word.split("")[0]) == 0)
      word = word.to_f
      if sentence[index_operand - 1] == "minus" || sentence[index_operand - 1] == "negative"
        word = word * -1
      end
      if operators[operators.length - 1] == "divided"
        word = 1 / word
      end
      operands << word
      prev_is_operand = true
    end

    index_operand += 1
  end

  index_operator = 0
  is_first_operation = true
  answer = 0.0

  operators.each do |operator|

    if is_first_operation == true
      is_first_operation = false
      left_operand = operands[0]
    else
      left_operand = answer
    end
    
    if(operator == 'to')
      answer = left_operand ** operands[index_operator + 1]
    elsif(operator == 'times' || operator == 'divided')
        answer = left_operand * operands[index_operator + 1]
    elsif (operator == 'plus' || operator == 'minus')
      answer = left_operand + operands[index_operator + 1]
    end

    index_operator += 1
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

