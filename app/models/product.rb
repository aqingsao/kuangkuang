class Product < ActiveRecord::Base
  attr_accessible :name, :price
  validates :name, presence: true, length: {minimum:5}

end
