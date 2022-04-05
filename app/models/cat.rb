class Cat < ApplicationRecord
  
  belongs_to :cus
  
  has_one_attached :image
end
