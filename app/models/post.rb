class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :cat
  has_many :comments, dependent: :destroy

  has_one_attached :image
end
