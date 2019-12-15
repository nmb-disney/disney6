class Cd < ApplicationRecord
	TESTS = belongs_to :artist
belongs_to :genre
belongs_to :label


has_many :reviews, dependent: :destroy
has_many :order_cds, dependent: :destroy
has_many :interests, dependent: :destroy
has_many :cart_cds, dependent: :destroy
has_many :discs, dependent: :destroy
has_many :restocks, dependent: :destroy

 accepts_nested_attributes_for :discs, allow_destroy: true

def Cd.search(search, search_option)
  	if search_option == "3"
     	Cd.where(['cd_title LIKE ?', "%#{search}%"])
  	else
     	Cd.all
  	end
end


end
