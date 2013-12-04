class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product

  # memoization
  # def order
  #   @the_order ||= Order.find_by(id: self.order_id)
  # end

  after_create :update_order
  after_destroy :update_order

  def update_order
    if (self.order.line_items.count >= 3) || (order.total > 2500)
      self.order.shipping_charge = 0
      self.order.save
    else
      self.order.shipping_charge = 700
      self.order.save
    end
  end
end
