class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product

  after_create :update_order
  after_destroy :update_order

  def update_order
    puts "Updating order..."
    puts self.order.line_items.count
    if self.order.line_items.count >= 3
      self.order.shipping_charge = 0
      self.order.save
    else
      puts "Setting total to 700"
      self.order.shipping_charge = 700
      self.order.save
    end
  end
end
