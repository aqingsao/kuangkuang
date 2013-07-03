class Cart < ActiveRecord::Base
  attr_accessible :user_id
  has_and_belongs_to_many :products
end
