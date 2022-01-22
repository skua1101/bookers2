class Book < ApplicationRecord

  belongs_to :user #Userモデルと1:Nの関係
  has_one_attached :profile_image

end
