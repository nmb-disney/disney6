class Artist < ApplicationRecord
	has_many :cds, dependent: :destroy



	def Artist.search(search, search_option)
  	if search_option == "1"
     	Artist.where(['artist_name LIKE ?', "%#{search}%"])
    elsif search_option == "2"
      Artist.where(['artist_name LIKE ?', "%#{search}%"])
  	elsif search_option == "a"
  		Artist.where(['artist_name LIKE ?', "%#{search}%"])
  	else
     	Artist.all
  	end
	end

end
