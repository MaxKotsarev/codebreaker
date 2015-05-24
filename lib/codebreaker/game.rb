module Codebreaker
  class Game
  	NUMBER_OF_TURNS = 10
    SECRET_CODE_LENGTH = 4 

  	def initialize
      @secret_code = ""
      @number_of_turns = NUMBER_OF_TURNS 
      @hint_position = rand(SECRET_CODE_LENGTH)
      #@last_guess = "" #use for hint
    end
 
    def start
      SECRET_CODE_LENGTH.times {@secret_code << (1 + rand(6)).to_s} 
    end

    def take_user_input
      user_input = gets
      return user_input
    end

    def mark_user_guess(user_input)
    	answer = ""
      tmp_code = ""
      tmp_input = ""
      for i in 0...SECRET_CODE_LENGTH
        if user_input[i] == @secret_code[i]
          tmp_code << "+"
          tmp_input << "+"
        else 
          tmp_input << user_input[i]
          tmp_code << @secret_code[i]
        end 
      end
    	for i in 0...SECRET_CODE_LENGTH
    		if tmp_input[i] == tmp_code[i]
    			answer << "+"
    		elsif tmp_code.include? tmp_input[i]
    			answer << "-"
    		end	
    	end
      return answer
    end

    def decrease_avaliable_turns 
      @number_of_turns = @number_of_turns - 1
    end

    def hint
      hint = "" 
      for i in 0...SECRET_CODE_LENGTH
        i == @hint_position ? hint << @secret_code[i] : hint << "*"
      end
      return hint
    end

=begin
      if answer.size == 0 
        puts "Secret code doesn't include any number of your guess" 
      else 
        puts answer
      end   
      if answer == "++++"
        puts "Congrats! You won!"
        return false
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
=end

  end
end

#=begin
game = Codebreaker::Game.new
game.instance_variable_set(:@secret_code, "1234")

puts game.hint
#=end

