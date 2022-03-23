# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



User.create first_name: "Victor", last_name: 'Ancajima', email: "victor@gmail.com"
User.create first_name: "Aldair", last_name: 'Morales', email: "aldair@gmail.com"
User.create first_name: "Jhon", last_name: 'Flores', email: "jhon@gmail.com"
User.create first_name: "Efrain", last_name: 'Holguin', email: "efrain@gmail.com"
User.create first_name: "Fabricio", last_name: 'Ruesta', email: "efrain@gmail.com"


6.times do | index | 
  Book.create title: "Book #{index + 1}", author: "Anonymous", quantity: 3
end

puts "===> #{User.all.count} users created"
puts "===> #{Book.all.count} books created"
