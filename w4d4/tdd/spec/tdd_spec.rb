require "tdd.rb"
require "rspec"

describe Array do

  describe "#remove_dups" do
    let(:array) {Array.new([1, 2, 1, 3, 3]) }

    it "should not return the same array" do
      expect(array.remove_dups).to_not be(array)
    end

    it "should return unique elements in orignal order" do
      expect(array.remove_dups).to eq([1, 2, 3])
    end
  end

  describe "#two_sum" do
    let(:array) {Array.new([-1, 0, 2, -2, 1])}

    it "should return a new array" do
      expect(array.two_sum).to be_a(Array)
    end
    it "should return indices that sum to zero" do
      expect(array.two_sum).to include([0, 4])
      expect(array.two_sum).to include([2, 3])
    end
    it "should return the indices 'dictionary-wise'" do
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do

    let(:array) {Array.new([[0, 1, 2],[3, 4, 5],[6, 7, 8]])}

    it "should return a 2d array" do
      expect(array.my_transpose.all? { |ele| ele.is_a?(Array)}).to be(true)
    end

    it "should return a transposed array" do
      expect(array.my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end

  end

  describe "#stock_picker" do
    let(:array) {Array.new([10, 15, 8, 20, 22, 18, 27, 14, 8, 35])}
    it "should return two indices in an array" do
      expect(array.stock_picker).to be_a(Array)
      expect(array.stock_picker.length).to eq(2)
    end
    it "should return highest profit" do
      expect(array.stock_picker).to eq([2, 9])
    end
    
  end
end