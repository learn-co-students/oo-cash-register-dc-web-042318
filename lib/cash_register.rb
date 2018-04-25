class CashRegister
  attr_accessor :total
  attr_reader :price, :quantity, :discount, :item
  
  def initialize(discount = 100)
    @total = 0.0
    @discount = discount
    @items = Hash.new
  end

  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    @items[title] = quantity
  end

  def apply_discount
    @total = total * ((100 - @discount) * 0.01)
    if @discount < 100
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @items.map{ |k, v| [k] * v}.flatten
  end

  def void_last_transaction
    values = @items.values
    values.pop
    @total = values.inject{ |sum, n| sum + n}.to_f
  end
end