class Product < ActiveRecord::Base
  attr_accessible :name, :price
  validates :name, presence: true

  belongs_to :order
  belongs_to :shopping_cart

end
