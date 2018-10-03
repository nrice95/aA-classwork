require "hanoi"
require "rspec"

describe "Towers of Hanoi Specs" do
  subject(:hanoi) { Hanoi.new }

  describe "#initialize" do
    it "should initialize with three towers" do
      expect(hanoi.towers.length).to be(3)
    end
    it "should initialize first tower with 3 discs" do
      expect(hanoi.towers[0].length).to be(3)
    end
  end

  # describe "#valid_move?" do
  #   let(:hanoi2) { double("hanoi2", :towers => [[3], [2], [1]]  )}
  #   it "should not allow you to move disc from an empty tower" do
  #     expect(hanoi2.valid_move?(1, 2)).to be(false)
  #   end
  #
  #   it "should not allow you to move a bigger disc on top of a smaller disc" do
  #     expect(hanoi2.valid_move?(1, 2)).to be(false)
  #   end
  #
  # end

  describe "#move" do
    before(:each) do
      hanoi.move(0,2)
    end
    it "should only make move if move is valid" do
      expect(hanoi.towers).to eq([[3,2],[],[1]])
    end

    it "should remove top disc from from_tower" do
      # hanoi.move(0,2)
      expect(hanoi.towers[0]).to eq([3,2])
    end

    it "should add disc to top of to_tower" do
      expect(hanoi.towers[2]).to eq([1])
    end
  end

  describe "won?" do
    it "should return true if any towers have all three discs" do

    end
  end

end
