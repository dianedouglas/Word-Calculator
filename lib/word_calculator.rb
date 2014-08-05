def calculate(sentence)
  operands = []

  sentence.split(" ").each do |word|
    if ((/[0-9]/ =~ word.split("")[0]) == 0)
      operands << word.to_i
    end
  end
  answer = operands[0] + operands[1]
  
end
