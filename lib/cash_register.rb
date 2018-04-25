require "pry"
class CashRegister
    attr_accessor :total, :discount, :last_transaction
    attr_reader :items
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = 0
    end

    def add_item(title, price, quantity=1)
        quantity.times do
           self.items << title
        end
        self.last_transaction = price * quantity
        self.total += price * quantity
    end

    def apply_discount
        if self.discount != 0
            self.total = self.total * (100 - self.discount) / 100
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end
