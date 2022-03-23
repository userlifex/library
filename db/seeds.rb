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

Book.create title: "INTRODUCCIÓN A LA ECONOMÍA", author: 'Kugman Paul', release_date: '2015-02-10', quantity: 1
Book.create title: "GUIA DE ESCRITURA Y ESTILO", author: 'Grillo María Del Carmen', release_date: '2011-09-19', quantity: 2
Book.create title: "PRINCIPIOS DE MACROECONOMIA", author: 'Boza Carreno Luis', release_date: '2020-02-28', quantity: 8

6.times do | index | 
  Book.create title: "Book #{index + 1}", author: "Anonymous", quantity: 3
end

puts "===> #{User.all.count} users created"
puts "===> #{Book.all.count} books created"
