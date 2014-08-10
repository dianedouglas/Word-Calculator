require 'pry'

def calculate_sentences(sentences)
  # sentences.split(" ").each do |word|
  #   prev_word = ""
  #   if prev_word.include? ("?")
  #     current_sentence = sentences.split(" ").slice(0, i)
  #     next_sentence = sentences.split(" ").slice(i, sentences.length - i)
  #     results << calculate(current_sentence)
  #     results << calculate(next_sentence)
  #   end
  # end
  results = []
  i = 0
  while sentences.include? ("?")
    prev_word = ""
    words = sentences.split(" ")
    words.each do |word|
      if prev_word.include? ("?")
        binding.pry
        current_sentence = words.slice(0, i).join
        sentences = words.slice(i, sentences.length - i).join
        results << calculate(current_sentence)
        break
      end
      i += 1
      prev_word = sentences[i - 1]
    end
    # if sentences.count("?") <= 1

  end
  results
end

def calculate(sentence)
  operands = []
  operators = []
  prev_is_operand = false
  i = 0

  sentence.split(" ").each do |word|
    # prev_word = ""
    # if prev_word.include? ("?")
    #   current_sentence = sentence.split(" ").slice(0, i)
    #   next_sentence = sentence.split(" ").slice(i, sentence.length - i)
    #   results << calculate(current_sentence)
    #   results << calculate(next_sentence)
    # end

    if (prev_is_operand)
      operators << word
      prev_is_operand = false
    end

    #if first letter contains a number
    if ((/[0-9]/ =~ word.split("")[0]) == 0)
      operands << word.to_f
      prev_is_operand = true
    end
  i += 1
  prev_word = sentence.split(" ")[i - 1]
  end

  i = 0
  is_first_operation = true
  answer = 0.0
  left_operand = 0.0

  operators.each do |operator|

    if is_first_operation == true
      is_first_operation = false
      left_operand = operands[i]
    else
      left_operand = answer
    end
    
    if(operator == 'to')
      answer = left_operand ** operands[i + 1]
    elsif(operator == 'times' || operator == 'divided')
      if operator == 'times'
        answer = left_operand * operands[i + 1]
      elsif operator == 'divided'
        answer = left_operand / operands[i + 1]  
      end    
    elsif (operator == 'plus' || operator == 'minus')
      if operator == 'plus'
        answer = left_operand + operands[i + 1]
      elsif operator == 'minus'
        answer = left_operand - operands[i + 1]  
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

