class Cat < ApplicationRecord

  belongs_to :customer

  has_one_attached :cat_image

  enum gender: { male: 0, female: 1, unclear:2 }

  validates :cat_name,presence:true
  validates :introduction,length:{maximum:200}
  validates :other,length:{maximum:200}
  validates :cat_image,presence:true

end
