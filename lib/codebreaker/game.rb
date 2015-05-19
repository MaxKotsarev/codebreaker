module Codebreaker
  class Game
  	attr_accessor :secret_code, :number_of_turns
  	NUMBER_OF_TURNS = 10 

  	def initialize
      @secret_code = ""
      @number_of_turns = NUMBER_OF_TURNS 
    end
 
    def start
      4.times {@secret_code << (1 + rand(6)).to_s} 
      ask_user_guess_and_answer
    end

    def ask_user_guess_and_answer
    	tell_user_what_to_do
    	user_input = gets 
    	#Добавить проверку корректности инпута (4 цифры, от 1 до 6.. ну или "hint")
    	answer = ""
    	for i in 0..3
    		if user_input[i] == @secret_code[i]
    			answer << "+"
    		elsif @secret_code.include? user_input[i]
    			answer << "-"
    		end	
    	end
    	if answer.size == 0 
    		puts "Secret code doesn't include any number of your guess" 
    	else 
    		puts answer
    	end  	
    	if answer == "++++"
    		puts "Congrats! You won!"
    		return false
    	end
    	@number_of_turns = @number_of_turns - 1
    	ask_user_guess_and_answer
    end

    def tell_user_what_to_do
    	if @number_of_turns == NUMBER_OF_TURNS
	    	puts "Lets start! Try to guess secret code from 4 numbers from 1 to 6. You have #{@number_of_turns} turns."
	   	elsif @number_of_turns > 0
	   		puts "Try again.. #{@number_of_turns} turns left"
	    else 
	    	puts "You lose the game"
    	end
    end

  end
end

=begin
game = Codebreaker::Game.new
game.start
=end

