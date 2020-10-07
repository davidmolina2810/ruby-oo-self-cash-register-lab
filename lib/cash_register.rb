require 'pry'

class CashRegister

  attr_accessor :discount, :total

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=nil)
    if quantity
      @items << {title => price, :quantity => quantity}
      @total += (price * quantity) 
    else
      @items << {title => price}
      @total += price 
    end
  end

  def apply_discount
    if @discount
      @total -= (total * discount/100.0)
      return "After the discount, the total comes to $#{self.total.to_i}."
    end
    return "There is no discount to apply."
  end

  def items 
    @items.each_with_object([]) do |item, arr| # iterate of AoH @items
      if item[:quantity] && item[:quantity] > 0 
        item[:quantity].times do 
          arr << item.keys[0] # append item to arr
        end
      else
        arr << item.keys[0]
      end
    end
  end

  def void_last_transaction
    item = @items.pop
    binding.pry
    if @items.length > 0
      self.total -= item.values[0]
    else 
      self.total = 0.0
    end
  end

end
