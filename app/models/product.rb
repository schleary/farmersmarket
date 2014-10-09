class Product < ActiveRecord::Base

  belongs_to :vendors
  #or has_many?

  belongs_to :market, through: :vendors

end
