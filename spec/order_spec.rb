require 'order'

describe "Order" do

  it "allows for checking that order is an instance of Order class" do
    order = Order.new
    order.submit_order("R12", 100)
    expect(order).to be_instance_of(Order)
  end

  it "allows for checking that order key is being set up correctly" do
    order = Order.new
    order.submit_order("R12", 100)
    expect(order.product_codes).to eq(["R12"])
  end

  it "check for multiple orders are correctly passed for ordering" do
    order = Order.new
    order.submit_order("R12", 100)
    order.submit_order("L09", 54)
    expect(order.product_codes).to eq(["R12", "L09"])
  end

  it "allows for checking that order quantity is being set up correctly" do
    order = Order.new
    order.submit_order("R12", 100)
    order.submit_order("L09", 54)
    expect(order.get_product_quantity("L09")).to eq(54)
    expect(order.get_product_quantity("R12")).to eq(100)
  end

end