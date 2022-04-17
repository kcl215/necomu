class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :post

  validates :text,presence:true,length:{maximum:100}

end
