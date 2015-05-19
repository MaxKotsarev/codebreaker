require 'spec_helper'
 
module Codebreaker
  describe Game do
    let(:game) {game = Game.new}

    describe "#start" do
      before do 
        game.stub(:ask_user_guess_and_answer)
        game.start   
      end 

      it "saves secret code" do
        expect(game.instance_variable_get(:@secret_code)).not_to be_empty
      end
 
      it "saves 4 numbers secret code" do
        expect(game.instance_variable_get(:@secret_code).length).to eq(4)
      end
 
      it "saves secret code with numbers from 1 to 6" do
        expect(game.instance_variable_get(:@secret_code)).to match(/[1-6]+/)
      end

      it "secret code is rendomly generated - different every time" do 
      	game2 = Game.new
        game2.stub(:ask_user_guess_and_answer)
      	game2.start
      	expect(game.instance_variable_get(:@secret_code)).not_to eq(game2.instance_variable_get(:@secret_code))
      end

      it "call game.ask_user_guess_and_answer method" do 
        pending # как сделать, что бы тест работал? :)
        expect(game).to receive(:ask_user_guess_and_answer)
      end
  	end

    describe "#ask_user_guess_and_answer" do
      it "saves users input to 'answer' variable"
    end

    describe "#tell_user_what_to_do" do 
      before {stub_const("NUMBER_OF_TURNS", 10)}
      it "outpu's 'game-start' massage, ask user to guess secret code and tell about amount of terns left" do
        game.number_of_turns = NUMBER_OF_TURNS
        $stderr.puts "Lets start! Try to guess secret code from 4 numbers from 1 to 6. You have 10 turns."
      end

      it "output's to try againe and" do
        game.number_of_turns = NUMBER_OF_TURNS - 1
        $stderr.puts "Try again.. 9 turns left"
      end

      it "output's about losing game if no terns left" do
        game.number_of_turns = 0
        $stderr.puts 'You the game'
      end
    end

    describe "#mark_the_guess(user_input)" do
      before {game.secret_code = "1234"}
      it "return ++++ if user guess matches the secret code exactly" do
        user_input = "1234"
        $stderr.puts "+++"
      end
    end
  end
end