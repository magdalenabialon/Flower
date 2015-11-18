require_relative 'flower_shop'
class Order

  PRICE_LIST_ROSES_CONST = {10 => 12.99, 5 => 6.99}
  PRICE_LIST_TULIPS_CONST =  {9 => 16.99, 5 => 9.95, 3 => 5.95}
  PRICE_LIST_LILIES_CONST = {9 => 24.95, 6 => 16.95, 3 => 9.95}
  ROSES = "R12"
  LILIES = "L09"
  TULIPS = "T58"

  attr_accessor :quantity, :code, :order

  def initialize
    @quantity = 0
    @code = ""
    @order = Hash.new
  end

  def display_bundle_breakup (price_holder)

    puts "try again" if price_holder.empty?
    price_holder.each do |key, value|
      puts "Cost: $ #{key}"
      puts '------------------'
      puts "Qty | Bundle Size"
      value.each do |value|
        puts " #{value} "
      end
      puts '------------------'
      break
    end

  end

  def display_bundle (price_holder)
    puts "try again" if price_holder.empty?
    price_holder.each do |key, val|
      puts "Cost: $ #{key.round(3)}"
      puts '------------------'
      puts "Bundle Size"
      puts " #{val} "
      puts '------------------'
      break
    end
  end

  def order_handler (quantity, code)
    case code.to_s
      when ROSES
        puts "ROSES"
        price_holder = FlowerShop.new(PRICE_LIST_ROSES_CONST, quantity).calculator
        display_bundle_breakup price_holder
      when LILIES
        puts "LILIES"
        price_holder = FlowerShop.new(PRICE_LIST_LILIES_CONST, quantity).calculator
        display_bundle_breakup price_holder
      when TULIPS
        puts "TULIPS"
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
    #checks that number is in the specified range
    while(string = gets.chomp.to_s)
      next  puts "enter a valid product code".capitalize unless string == "R12" or string == "T58" or string == "L09"
      return string
    end
  end

  def take_order

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
      order[code] = quantity
      puts "press q|Q to QUIT or press any key to buy more flowers"
      if gets.chomp.downcase == "q"
        break
      else
        next
      end
    end
    process_order
  end

  def process_order
    order.each do |product_code, quantity|
      order_handler quantity, product_code
    end
  end

  def announcement
    puts "Welcome to THE FLOWER SHOP"
  end

end