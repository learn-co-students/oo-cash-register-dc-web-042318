require 'pry'

class CashRegister

  attr_accessor :discount, :total, :items, :transactions, :transaction_id

  #Initializes register with a total of zero, an empty items array, and an
  #empty transaction hash. The discount defaults to zero but the user can
  #enter their discount as an interger (converted to a percentatge later).
  #The transaction_id is set to zero as there have been no transactions yet.
  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
    @transaction_id = 0
    @transactions = {}
  end

  #Adds a transaction for each group of items added.
  #Increases the total of the register by the items total price.
  #Pushs the title of each item into the item array based on the quanity.
  def add_item(title, price, quantity=1)
    store_transaction(title, price, quantity)
    self.total += (price * quantity)
    quantity.times {self.items << title}
  end

  #Pushes each transaction into a transaction hash with the transaction id
  #as the hash id. Inceases the transaction id by 1.
  def store_transaction(title, price, quantity)
    self.transaction_id += 1
    self.transactions[self.transaction_id] = {
      :title => title,
      :price => price,
      :quantity => quantity
    }
  end

  #Determines the discount amount by converting the discount into a percentage
  #If the discount is 0, returns a message. If the discount is greater than 0
  #decreases the total by the discount amount.
  def apply_discount
    discount_amount = (self.total * (self.discount * 0.01))
    if discount_amount == 0
      "There is no discount to apply."
    else
      self.total -= discount_amount
     "After the discount, the total comes to $#{self.total.round(0)}."
    end
  end

  #Finds the last transaction by referencing the current transaction id.
  #Subtracts the total by the amount of the last transaction.
  #Changes the transaction in the transaction hash to VOID.
  def void_last_transaction
    last_transaction = transactions{transaction_id}.values[0]
    #binding.pry
    self.total -= (last_transaction[:price] * last_transaction[:quantity])
    last_transaction = "VOID"
  end

end
