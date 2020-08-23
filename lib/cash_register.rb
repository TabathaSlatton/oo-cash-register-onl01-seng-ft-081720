require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :current_item_price
    def initialize(discount = 1)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @current_item_price = price * quantity
        @total = price * quantity + @total
        i = quantity
        while i > 0
        @items << title 
        i -=1
        end
    end

    def apply_discount
        
        if @discount <= 1
            "There is no discount to apply."
        else
        discount_float = @discount.to_f / 100.0 
        applied_discount = 1.0 - discount_float
        @total = applied_discount * @total
        "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    
    def items
        @items
    end

    def void_last_transaction
        @items.pop
        @total -= @current_item_price
    end
end
