# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@@productIndex = 0;
def productId
	sprintf("34%03d%02d", rand(1000), @@productIndex += 1).to_i
end

100.times do |i|
	p = Product.new(:name=>"product #{i}", :price=>rand(10000).to_f)
	p.id = productId
	p.save!
end
# p1 = Product.new(:name=>'IPad 3', :price=>3888.00)
# p2 = Product.new(:name=>'Sony Digital Camera', :price=>1999.00)
# p3 = Product.new(:name=>'iPone 5', :price=>4666.00)
# p4 = Product.new(:name=>'MacBook Pro', :price=>9999.00)
# p5 = Product.new(:name=>'MacBook Air', :price=>12888.00)