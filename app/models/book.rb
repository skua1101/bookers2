class Book < ApplicationRecord

  belongs_to :user #Userモデルと1:Nの関係

end
