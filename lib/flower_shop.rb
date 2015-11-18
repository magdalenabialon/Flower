class FlowerShop

  COUNTER_CONST = 20
  ROUNDING_CONST = 2
  attr_accessor :price_list, :quantity, :price_holder, :bundle_size_holder

  def initialize (price_list,quantity)

    @price_list = price_list
    @quantity = quantity
    @price_holder = Hash.new
    @bundle_size_holder = Hash.new
  end

  def calculator

    keys = price_list.keys.sort
    singles(keys)
    doubles(keys)
    triplets(keys) if keys.length > 2
    price_holder.sort.to_h
    #bundle_size_holder.sort.to_h
    #[price_holder.sort.to_h,bundle_size_holder.sort.to_h]

  end

  def bundles
    price_list.keys
  end



  private

  def triplets (keys)

    lowest,middle,highest = keys[0],keys[1],keys[2]
    counter = COUNTER_CONST
    while counter > 0
      content = []
      if ((quantity-highest*counter) > middle) and ((quantity-highest*counter)%middle)%lowest == 0 and (quantity-(highest*counter) > 0) and ((quantity-highest*counter)%middle) > 0

        price = (price_list[highest] * counter)
        content << (counter).to_s + ' X ' + highest.to_s
        bundle_size = counter
        revised_quantity = quantity-(highest*counter)
        price += (price_list[middle] * (revised_quantity/middle))
        bundle_size += (revised_quantity/middle)
        content << (revised_quantity/middle).to_s + ' X ' + middle.to_s
        revised_quantity = revised_quantity%middle
        price += (price_list[lowest] * (revised_quantity/lowest))
        bundle_size += (revised_quantity/lowest)
        content << (revised_quantity/lowest).to_s + ' X ' + lowest.to_s
        price_holder[price.round(ROUNDING_CONST)] = content
        bundle_size_holder[price.round(ROUNDING_CONST)] = bundle_size
      end
      counter-=1
    end

  end

  def doubles (keys)

    total_combinations = keys.combination(2).to_a
    total_combinations.each do |combination|
      combination.sort!
      lowest,highest = combination[0],combination[1]
      counter = COUNTER_CONST
      while counter > 0
        content = []
        if ((quantity-highest*counter) % lowest == 0) and (quantity-highest*counter) > 0 and quantity > highest
          price = (price_list[highest] * counter)
          bundle_size = counter
          content << (counter).to_s + ' X ' + highest.to_s
          revised_quantity = quantity-(highest*counter)

          price += (price_list[lowest] * (revised_quantity/lowest))
          bundle_size += (revised_quantity/lowest)
          content << (revised_quantity/lowest).to_s + ' X ' + lowest.to_s
          price_holder[price.round(ROUNDING_CONST)] = content
          bundle_size_holder[price.round(ROUNDING_CONST)] = bundle_size
        end
        counter-=1
      end
    end

  end

  def singles (keys)

    keys.each do |key|
      content = []
      if quantity % key == 0
        price = (price_list[key] * (quantity/key))
        bundle_size = (quantity/key)
        content << (quantity/key).to_s + ' X ' + key.to_s
        price_holder[price.round(ROUNDING_CONST)] = content
        bundle_size_holder[price.round(ROUNDING_CONST)] = bundle_size
      end
    end
  end

end