class Vendor < ActiveRecord::Base

  belongs_to :markets
  has_many :products
  
end
