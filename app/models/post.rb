class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :ca
  has_many :comments, dependent: :destroy

  has_one_attached :image
end
