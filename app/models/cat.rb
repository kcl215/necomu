class Cat < ApplicationRecord

  belongs_to :customer

  has_one_attached :cat_image
end
