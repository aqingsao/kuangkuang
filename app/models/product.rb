class Product < ActiveRecord::Base
  attr_accessible :name, :price
  validates :name, presence: true

  belongs_to :order
end
