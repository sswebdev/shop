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
  { name: "Laptop", price: '89900' }
]

Product.destroy_all if Rails.env.development?

product_data.each do |item|
  product = Product.new(name: item.name, price: item.price)
  product.save
end

puts "#{Product.count} products."
