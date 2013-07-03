class Order < ActiveRecord::Base
  attr_accessible :user_id
  has_many :products
end
