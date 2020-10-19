class Order < ApplicationRecord
    has_many :items

    def value
        items.includes(:product).sum('price * quantity')
    end
end
