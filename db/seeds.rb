# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Prices are in cents
product_data = [
  { name: "Waffle Maker", price: '2499' },
  { name: "Stapler", price: '999' },
  { name: "iPad", price: '49900' },
  { name: "TV", price: '69500' },
  { name: "Chair", price: '11995' },
  { name: "Table", price: '29900' },
  { name: "Bookshelf", price: '7900' },
  { name: "Kindle", price: '2499' },
  { name: "Pillow", price: '999' },
  { name: "Piano", price: '49900' },
  { name: "Coffee Mug", price: '69500' },
  { name: "Soap", price: '11995' },
  { name: "Hat", price: '29900' },
  { name: "Remote Control", price: '7900' },
  { name: "Laptop", price: '89900' }
]

Product.destroy_all if Rails.env.development?

product_data.each do |item|
  product = Product.new(name: item[:name], price: item[:price])
  product.save
end

puts "#{Product.count} products."

names = ["Diana Johnson", "Carl Edwards", "Angela Cook", "Samuel Cooper", "Robert Murphy",
"Sandra Brown", "Maria Thompson", "Lawrence Perry", "Amy Hill", "Eugene Nelson"]

Customer.destroy_all if Rails.env.development?
names.each do |name|
  customer = Customer.new(name: name, email: "#{name.parameterize.underscore}@example.com")
  customer.save
end

# Generate random orders
Customer.all.each do |customer|
  rand(1..20).times do
    order = customer.orders.create ordered_on: rand(1..7).days.ago
    rand(1..2).times do
      the_product = Product.sample
      order.add_product(the_product)
      order.add_product(the_product) if rand(1..3) == 1
    end
  end
end

puts "#{Order.count} orders created."

