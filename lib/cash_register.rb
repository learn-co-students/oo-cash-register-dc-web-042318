class CashRegister
  attr_accessor :total
  attr_reader :price, :quantity, :discount, :items_hash
  
  def initialize(discount = 100)
    @total = 0.0
    @discount = discount
    @items_hash = Hash.new
  end

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    self.items_hash[title] = quantity
  end

  def apply_discount
    self.total = total * ((100 - self.discount) * 0.01)
    if self.discount < 100
      return "After the discount, the total comes to $#{self.total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    self.items_hash.map{ |k, v| [k] * v}.flatten
  end

  def void_last_transaction
    all_values = self.items_hash.values
    all_values.pop
    self.total = all_values.inject{ |sum, n| sum + n}.to_f
  end
end