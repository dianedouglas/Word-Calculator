def calculate_sentences(sentences)
  errors = check_for_errors(sentences)
  if errors.length > 0
    errors
  else

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
    if ((word.split("")[0] =~ /[0-9]/) != nil)
      word = word.to_f
      if sentence[index_operand - 1] == "minus" || sentence[index_operand - 1] == "negative"
        word = word * -1
        if sentence[index_operand - 2] == "minus" 
          word = word * -1
        end
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

  if operands.length <= 1 || operators.length < 1
    answer = 'There has been an error with your input. Please make sure to use at least two numbers.'
  else 

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
  end

  answer
end

def check_for_errors(sentences)
  errors = []
  number_words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "twenty", "thirty", "fifty"]
  symbols = ["-", "*", "/", "+"]
  sentences = sentences.downcase

  symbols.each do |symbol|
    if sentences.include? symbol
      errors << 'I like words! Please use minus or negative instead of a dash, or "times" instead of "*".'
      break
    end
  end
  if !sentences.include? ("?")
    errors << 'Please ask a question.'
  end
  if (sentences =~ /[0-9]/) == nil
    errors << 'Please include at least two numbers.'
  end
  if (sentences.include? ("square")) || (sentences.include? ("cube"))
    errors << 'When using powers, please phrase your question in the standard form of X to the power of Y or X to the Yth power.'
  end

  number_words.each do |number_word|
    if sentences.include? number_word
      errors << "You don't need to write out your numbers. Please just enter the digits inside your question."
      break
    end
  end

  errors
end
