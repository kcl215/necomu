class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :cat, optional: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
