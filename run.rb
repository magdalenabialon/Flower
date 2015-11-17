require_relative ('lib/flower_shop')


def display (price_holder)

  puts "try again" if price_holder.empty?
  price_holder.each do |key, val|
    puts "Cost: $ #{key.round(3)}"
    puts '------------------'
    puts "Qty | Bundle Size"
    val.each do |v|
      puts " #{v} "
    end
    puts '------------------'
  end

end

def order_handler (quantity, code)

  price_list_tulips = {9 => 16.99, 5 => 9.95, 3 => 5.95}
  price_list_lilies = {9 => 24.95, 6 => 16.95, 3 => 9.95}
  price_list_roses = {10 => 12.99, 5 => 6.99}

  case code.to_s
    when "R12"
      puts "ROSES"
      price_holder = FlowerShop.new(price_list_roses, quantity).calculator
      display price_holder
    when "L09"
      puts "LILIES"
      price_holder = FlowerShop.new(price_list_lilies, quantity).calculator
      display price_holder
    when "T58"
      puts "TULIPS"
      price_holder = FlowerShop.new(price_list_tulips, quantity).calculator
      display price_holder
    else
  end

end


def take_order

  order = Hash.new
  loop do
    puts "Enter the quantity and product code"
    codeNquantity = gets.chomp.to_s
    input = codeNquantity.split
    order[input[1].to_s] = input[0].to_i
    puts "press q|Q to exit or press any key to buy more flowers"
    if gets.chomp.downcase == "q"
      break
    else
      next
    end
  end
  order.each do |product_code, quantity|
    order_handler quantity, product_code
  end

end

def announcement
  puts "Welcome to THE FLOWER SHOP"
end

announcement
take_order









