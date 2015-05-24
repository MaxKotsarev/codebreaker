require 'spec_helper'
 
module Codebreaker
  describe Game do
    let(:game) {game = Game.new}

    describe "#start" do
      before do 
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
      	game2.start
      	expect(game.instance_variable_get(:@secret_code)).not_to eq(game2.instance_variable_get(:@secret_code))
      end
    end

    describe "#mark_user_guess(user_input)" do
      before {game.instance_variable_set(:@secret_code, "1234")}
      
      it "marks number with '+' if it match number in same position in secret code" do   
        expect(game.mark_user_guess("1234")).to eq("++++")
      end
      it "marks number with '-' if it is the same as one of the numbers in the secret code but in a different position" do   
        expect(game.mark_user_guess("2561")).to eq("--")
      end
      it "does not mark number with '-' if it same to some number in secret code which have excect match in guess" do   
        expect(game.mark_user_guess("1561")).to eq("+")
      end
      it "marks number with '-' if secret code include same number except one which have same match" do
        game.instance_variable_set(:@secret_code, "1214")
        expect(game.mark_user_guess("1561")).to eq("+-")
      end
      it "can puts '-' between two '+' if not exect match (or two matches) is between exect matches" do
        game.instance_variable_set(:@secret_code, "1214")
        expect(game.mark_user_guess("1524")).to eq("+-+")
      end
    end

    describe "#decrease_avaliable_turns" do
      it "decrease amount of available turns by 1" do 
        game.instance_variable_set(:@number_of_turns, 10)
        expect {game.decrease_avaliable_turns}.to change{game.instance_variable_get(:@number_of_turns)}.from(10).to(9) 
      end 
    end

    describe "#hint" do    
      it "return secret code with one 'open' number and others marked as '*'" do
        stub_const("Codebreaker::Game::FOO", 4)
        game.instance_variable_set(:@secret_code, "1234")
        game.instance_variable_set(:@hint_position, 1)
        expect(game.hint).to eq("*2**")
      end
    end

    describe "need to be implemented" do
      it "saves score"
    end

  end #for describe Game do
end #for module Codebreaker