class Order < ActiveRecord::Base

  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  belongs_to :customer

  before_create :set_order_date

  def set_order_date
    self.ordered_on ||= Date.today
  end

  def total
    self.products.sum(:price)
  end

  def add_product(product)
    line_item = LineItem.new
    line_item.order_id = self.id
    line_item.product_id = product.id
    line_item.save
    self.reload
  end
end
