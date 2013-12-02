class Order < ActiveRecord::Base

  has_many :line_items
  has_many :products, through: :line_items

  # def shipping_charge
  #   if line_items.count >= 3
  #     0
  #   else
  #     700
  #   end
  # end

  def add_product(product)
    line_item = LineItem.new
    line_item.order_id = self.id
    line_item.product_id = product.id
    line_item.save
  end
end
