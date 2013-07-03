class Cart < ActiveRecord::Base
  attr_accessible :userId
  has_and_belongs_to_many :products
end
