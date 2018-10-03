require "methods"
require "rspec"


describe "#my_uniq" do
  subject(:arr) {[1,2,1,3,3]}

  it "should not call Ruby's #uniq method" do
    expect(arr.my_uniq).not_to receive(:uniq)
  end

  it "should not return duplicate elements" do
    expect(arr.my_uniq).not_to eq(arr)
  end

  it "should maintain original order" do
    expect(arr.my_uniq).to eq([1,2,3])
  end
end

describe "#two_sum" do
  subject(:arr) {[-1,0,2,-2,1]}

  it "should find positions of pairs that sum to 0" do
    expect(arr.two_sum).to eq([[0, 4], [2, 3]])
  end

  it "should be sorted in dictionary order" do
    expect(arr.two_sum).to eq(arr.two_sum.sort)
  end

  it "should not include superfluous pairs" do
    expect(arr.two_sum).to_not include([4, 0], [3, 2])
  end
end

describe "#my_transpose" do
  let(:matrix) {
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]
  }

  it "should correctly transpose the matrix" do
    expect(matrix.my_transpose).to eq(matrix.transpose)
  end

  it "should not call Ruby's #transpose method" do
    expect(matrix.my_transpose).not_to receive(:transpose)
  end

end

describe "#stock_picker" do
  let(:prices) {[3, 6, 2, 7, 4, 8, 3, 8, 1]}

  it "returns most profitable days(indexes of array)" do
    expect(prices.stock_picker).to eq([2, 5])
  end

  it "should buy low and sell high" do
    expect(prices[prices.stock_picker[0]] < prices[prices.stock_picker[1]])
    .to be(true)
  end

end
