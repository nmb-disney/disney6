class Cd < ApplicationRecord
	TESTS = belongs_to :artist
belongs_to :genre
belongs_to :label
attachment :jacket_image


has_many :reviews, dependent: :destroy
has_many :order_cds, dependent: :destroy
has_many :interests, dependent: :destroy
has_many :cart_cds, dependent: :destroy
has_many :discs, dependent: :destroy
has_many :restocks, dependent: :destroy


accepts_nested_attributes_for :discs, allow_destroy: true
accepts_nested_attributes_for :restocks, allow_destroy: true


enum status:{販売中:1,販売停止中:2}

validates :jacket_image, presence: true
validates :cd_title, presence: true
validates :price, presence: true
validates :release_date, presence: true







def Cd.search(search, search_option)
  	if search_option == "3"
     	Cd.where(['cd_title LIKE ?', "%#{search}%"])
    elsif search_option == "1"
      Cd.where(['cd_title LIKE ?', "%#{search}%"])
    elsif search_option == "t"
     	Cd.where(['cd_title LIKE ?', "%#{search}%"])
    elsif search_option == "s"
     	Cd.where(['status LIKE ?', "%#{search}%"])
    else
     	Cd.all
  	end
end


end
