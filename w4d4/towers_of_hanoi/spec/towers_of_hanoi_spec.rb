require "rspec"
require "towers_of_hanoi"

describe Game do

  subject(:game){Game.new}

  describe "#initialize" do

    it "creates stacks array" do
      expect(game.stacks).to be_a(Array)
    end

    it "stacks has 3 subarrays" do
      expect(game.stacks.length).to be(3)
      expect(game.stacks.all? { |ele| ele.is_a?(Array)}).to be(true)
    end

    it "the first stack should contain 4 discs" do
      expect(game.stacks.first.length).to be(4)
    end

    it "the four discs should be in descending order" do
      expect(game.stacks.first).to eq(game.stacks.first.sort.reverse)
    end

  end

  describe "#move" do
    context "player enters invalid move" do
      before(:each){game.stacks = [[1],[2],[4, 3]]}
      it "raises an error if position is outside of bounds" do
        
      end
    end
  end

  describe "#won?" do
    context "if the game has been won" do
      # before(:each) game.input = [0,2
      before(:each){game.stacks = [[],[],[4, 3, 2, 1]]}
      it "returns true if the four discs are in descending order at the second index of stacks" do
        expect(game.won?).to eq(true)
      end  
   end
   context "if the game has not been won" do
      it "returns false otherwise" do
        expect(game.won?).to eq(false)
      end
   end
  end

end
