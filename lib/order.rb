require_relative 'flower_shop'
class Order
=begin
Responsible for taking input from the user,validating the input and presenenting
the user with the total price and different combinations of bundle.
=end

  PRICE_LIST_ROSES_CONST = {10 => 12.99, 5 => 6.99}
  PRICE_LIST_TULIPS_CONST =  {9 => 16.99, 5 => 9.95, 3 => 5.95}
  PRICE_LIST_LILIES_CONST = {9 => 24.95, 6 => 16.95, 3 => 9.95}
  ROSES = "R12"
  LILIES = "L09"
  TULIPS = "T58"

  attr_accessor :my_order

  def initialize
    @my_order = Hash.new
    @@total_price = 0
  end

  def display_bundle_breakup (price_holder)
    # responsible for displaying total price and bundle combination
    puts "You can't buy this quantity.Try again with a different quantity" if price_holder.empty?
    price_holder.each do |key, values|
      @@total_price += key
      puts "Cost: $ #{key}"
      puts '------------------'
      puts "Qty | Bundle Size"
      values.each do |value|
        puts " #{value} "
      end
      puts '------------------'
      #break
    end
  end

  def display_bundle (price_holder)
    puts "Bundle could not be formed" if price_holder.empty?
    price_holder.each do |key, val|
      puts "Cost: $ #{key}"
      puts '------------------'
      puts "Bundle Size"
      puts " #{val} "
      puts '------------------'
      break
    end
  end

  def order_handler (quantity, code)
    # accepts the quantity and product_code and finds the price and required combination
    case code.to_s
      when ROSES
        puts " #{quantity} ROSES"
        price_holder = FlowerShop.new(PRICE_LIST_ROSES_CONST, quantity).calculator
        display_bundle_breakup price_holder
      when LILIES
        puts " #{quantity} LILIES"
        price_holder = FlowerShop.new(PRICE_LIST_LILIES_CONST, quantity).calculator
        display_bundle_breakup price_holder
      when TULIPS
        puts " #{quantity} TULIPS"
        price_holder = FlowerShop.new(PRICE_LIST_TULIPS_CONST, quantity).calculator
        display_bundle_breakup price_holder
      else
    end
  end

  def get_quantity
    #checks that number is in the specified range
    while(number = Integer(gets.chomp))
      next  puts "enter a valid number between 1 to 100" if number < 1 or number > 100
      return number
    end
  end

  def get_code
    #checks that code is correct
    while(string = gets.chomp.to_s)
      next  puts "enter a valid product code".capitalize unless string == ROSES or string == LILIES or string == TULIPS
      return string
    end
  end

  def take_order
    # aceepts the quantity and product code from the user
    loop do
      begin
        puts "enter the quantity ".capitalize
        quantity  = get_quantity
      rescue ArgumentError
        puts "Please enter a Integer value"
        retry
      end
      puts "enter the product code"
      code = get_code
      my_order[code] = quantity
      message
      if gets.chomp.downcase == "c"
        break
      else
        next
      end
    end
    process_order
  end

  def process_order
    my_order.each do |product_code, quantity|
      order_handler quantity, product_code
    end
    grand_total
    thanks
  end

  def submit_order (code, quantity)
    my_order[code] = quantity
  end

  def announcement
    puts "Welcome to THE FLOWER SHOP"
    puts "FLower Name      Product Code"
    puts "Rose             R12"
    puts "Lilie            L09"
    puts "Tulip            T58"
  end

  def message
    puts "press c|C to Check-Out or Press any other key to buy more flowers"
  end

  def user_message (code, quantity)
    puts "#{code}:  #{quantity}"
  end

  def thanks
    puts "Thank You for buying flowers !"
  end
  def product_codes
    my_order.keys
  end

  def get_product_quantity (code)
    my_order[code]
  end

  def grand_total
    puts "The total price is $ #{@@total_price.round(2)}"
  end

end