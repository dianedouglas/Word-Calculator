require './lib/word_calculator.rb'

def main_menu

puts "Welcome to the all-knowing word calculator!"
puts "I calculate the answers to your questions."
puts "(As long as they are about numbers.)"

  loop do 
    puts "Please enter your question..."
    question = gets.chomp
    answer = calculate_sentences(question)

    if answer.class == Array
      puts "Here ya go..."
      answer.each do |solution|
        puts solution
      end
    elsif answer.class == Fixnum
      puts "The answer is ... "
      puts answer
    elsif answer.class == String
      puts answer
    else
      puts "I'm afraid there has been an error with your question. Try again? y/n"
      user_input = gets.chomp
      if user_input != "y"
        puts "Nevermind. Until next time."
        exit
      end
    end
      
    puts "Would you like to ask another question? y/n"
    user_input = gets.chomp
    if user_input != "y"
      puts "Alrighty. Until next time."
      exit
    end        
  end
end
main_menu