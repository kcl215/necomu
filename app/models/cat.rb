class Cat < ApplicationRecord

  belongs_to :customer

  has_one_attached :cat_image

  enum gender: { male: 0, female: 1, unclear:2 }

end
