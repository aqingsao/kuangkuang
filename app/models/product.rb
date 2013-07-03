class Product < ActiveRecord::Base
  attr_accessible :name, :price
  validates :name, presence: true

  belongs_to :order
  has_and_belongs_to_many :carts
end
