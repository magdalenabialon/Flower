require 'flower_shop'

describe 'FlowerShop' do

  describe ".bundle" do

    it "returns an array of bundle sizes" do
      price_list_tulips = {9 => 16.99, 5 => 9.95, 3 => 5.95}
      flower_shop = FlowerShop.new(price_list_tulips,15)
      expect(flower_shop.bundles).to match_array([9,5,3])
    end

    it "checks for correctness of the bundle sizes" do
      price_list_tulips = {9 => 16.99, 5 => 9.95, 3 => 5.95}
      flower_shop = FlowerShop.new(price_list_tulips,15)
      expect(flower_shop.bundles).not_to match_array([15,6,4])
    end

  end

  describe "attributes" do

    it "allows for reading and writing of :price_list" do
      price_list_tulips = {9 => 16.99, 5 => 9.95, 3 => 5.95}
      flower_shop = FlowerShop.new(price_list_tulips,27)
      expect(flower_shop.price_list).to include(9 => 16.99, 5 => 9.95, 3 => 5.95)
    end


    it "allows for reading and writing of :quantity" do
      price_list_tulips = {9 => 16.99, 5 => 9.95, 3 => 5.95}
      flower_shop = FlowerShop.new(price_list_tulips,27)
      expect(flower_shop.quantity).to eq(27)
    end

    it "allows for reading and writing  of :bundle_size_holder" do
      price_list_tulips = {9 => 16.99, 5 => 9.95, 3 => 5.95}
      flower_shop = FlowerShop.new(price_list_tulips,27)
      expect(flower_shop.bundle_size_holder).to eq({})
    end

    it "allows for reading and writing  of :price_holder" do
      price_list_tulips = {9 => 16.99, 5 => 9.95, 3 => 5.95}
      flower_shop = FlowerShop.new(price_list_tulips,27)
      expect(flower_shop.price_holder).to eq({})
    end

  end

  it "allows for testing that the algorithm returns a Hash " do
    price_list_lilies = {9 => 24.95, 6 => 16.95, 3 => 9.95}
    flower_shop = FlowerShop.new(price_list_lilies,9)
    result = flower_shop.calculator
    expect(result).to be_instance_of(Hash)
  end

  it "allows for testing that the algorithm returns a empty Hash when combination cannot be formed " do
    price_list_lilies = {9 => 24.95, 6 => 16.95, 3 => 9.95}
    flower_shop = FlowerShop.new(price_list_lilies,4)
    result = flower_shop.calculator
    expect(result).to eq({})
  end

  it "allows for testing that algorithm returns a hash of size of one when only one combination can be formed" do
    price_list_lilies = {9 => 24.95, 6 => 16.95, 3 => 9.95}
    flower_shop = FlowerShop.new(price_list_lilies,3)
    result = flower_shop.calculator
    expect(result).to include(9.95 => ["1 X 3"])
  end

  context "desired test cases from the specification sheet" do

    it "allows for testing the results of roses bundle" do
      price_list_roses = {10 => 12.99, 5 => 6.99}
      flower_shop = FlowerShop.new(price_list_roses,10)
      result = flower_shop.calculator
      expect(result).to include(13.98 => ["2 X 5"], 12.99 => ["1 X 10"])

    end

    it "allows for testing the results of lilies bundle" do
      price_list_lilies = {9 => 24.95, 6 => 16.95, 3 => 9.95}
      flower_shop = FlowerShop.new(price_list_lilies,15)
      result = flower_shop.calculator
      expect(result).to include( 41.9 => ["1 X 9", "1 X 6"])

    end

    it "allows for testing the results of tulips bundle" do
      price_list_tulips = {9 => 16.99, 5 => 9.95, 3 => 5.95}
      flower_shop = FlowerShop.new(price_list_tulips,13)
      result = flower_shop.calculator
      expect(result).to include(25.85 => ["2 X 5", "1 X 3"])
    end
  end

  context "allows checking all the quantities for which combination cannot be formed" do

    it "returns an empty hash for lilie quantities for which combination can't be formed" do
      price_list_lilies = {9 => 24.95, 6 => 16.95, 3 => 9.95}
      flower_shop = FlowerShop.new(price_list_lilies,55)
      result = flower_shop.calculator
      expect(result).to eq({})

    end

    it "returns an empty hash for tulip quantities for which combination can't be formed " do
      price_list_tulips =  {9 => 16.99, 5 => 9.95, 3 => 5.95}
      flower_shop = FlowerShop.new(price_list_tulips,7)
      result = flower_shop.calculator
      expect(result).to eq({})
    end

    it "returns an empty hash for rose quantities for which combination can't be formed" do
      price_list_roses =  {10 => 12.99, 5 => 6.99}
      flower_shop = FlowerShop.new(price_list_roses,13)
      result = flower_shop.calculator
      expect(result).to eq({})
    end
  end
end

