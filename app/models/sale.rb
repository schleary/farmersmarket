class Sale < ActiveRecord::Base

  belongs_to :vendor
  has_many :products
  
end
