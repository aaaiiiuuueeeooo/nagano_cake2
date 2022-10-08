class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  enum making_stat: {cannot_be_manufactured: 0, awaiting_manufacture: 1, under_manufacture: 2, completion_of_production: 3 }

  def with_tax_price
    (price*1.1).floor
  end

  def subtotal
    item.with_tax_price*amount
  end
end
