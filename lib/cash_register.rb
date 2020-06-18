require 'pry'
class CashRegister

  attr_accessor :total, :items, :last_transaction
  attr_reader :discount
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    self.last_transaction = price * quantity
    self.total += self.last_transaction
    quantity.times do @items << title
    end
  end

  def apply_discount
    if discount != 0
      self.total = (self.total * ((100.0 - discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end

end
