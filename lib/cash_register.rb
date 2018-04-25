require 'pry'

class CashRegister

    attr_accessor :total
    attr_reader :discount, :quantity, :items

    @@last_item = ""
    @@last_price = 0
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        quantity.times do
            self.items << title
        end
        self.total += (price * quantity)
        @@last_item = title
        @@last_price = (price * quantity)
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = self.total - (discount.to_f / 100 * self.total)
            "After the discount, the total comes to $#{self.total.round}."
        end
    end

    def void_last_transaction
        # binding.pry
        # @@cart_items.delete_at(@@cart_items.index(@@last_item))
        self.total -= @@last_price
    end

end