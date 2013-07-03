# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p1 = Product.create(:name=>'IPad 3', :price=>3888.00)
p2 = Product.create(:name=>'Sony Digital Camera', :price=>1999.00)
p3 = Product.create(:name=>'iPone 5', :price=>4666.00)
p4 = Product.create(:name=>'MacBook Pro', :price=>9999.00)
p5 = Product.create(:name=>'MacBook Air', :price=>12888.00)

