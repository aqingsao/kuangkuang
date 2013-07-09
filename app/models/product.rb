class Product < ActiveRecord::Base
  attr_accessible :name, :price
  validates :name, presence: true
  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0, :less_than => 100000}

  belongs_to :order
  has_and_belongs_to_many :carts
end
