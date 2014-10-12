class Vendor < ActiveRecord::Base

  has_one :market
  has_many :products
  has_many :sales

end
