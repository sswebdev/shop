Can you write code to answer each question?
Hint: Each answer can be written with one line of code.

How many customers do we have?
  Customer.count

What is the most expensive thing we sell?
  Product.max(:price)

What is the subtotal of the_order (cost all items excluding shipping)?
  the_order.order_lines.sum(:price)

How much does the average customer spend per order?
  Order.average(:total)

Given:
  the_order = Order.sample
  the_product = Product.sample

How many items in the_order cost more than $100?

How many different products were purchased in the_order?
  the_order.products.uniq.count
  or
  Product.joins(:line_items).where('line_items.order_id = ?', the_order.id).uniq.count

How many times has the_product have been ordered?
  LineItem.where(product: the_product).count

How many orders contain the_product?
  Order.joins(:line_items).where('line_items.product_id = ?', the_product.id).uniq.count

How many people bought the_product?
  Customer.joins(:line_items).where('line_items.product_id = ?', the_product.id).uniq.count
  or
  Customer.joins(:orders => :line_items).where("line_items.product_id" => the_product.id).uniq.count
  or
  Customer.joins(:orders => :line_items).where(:line_items => { :product_id => the_product.id }).uniq.count

Extra Credit: (these might require more than one line of code)

What's the most popular product we sell?
  Product.find(LineItem.group(:product_id).count.max_by { |k,v| v }.first)

On average, how many items are purchased in a typical order?
  (Left as a challenge!)

