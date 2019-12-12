class Cd < ApplicationRecord
	belongs_to :artist
	belongs_to :genre
	belongs_to :label

	has_many :reviews, dependent: :destroy
	has_many :order_cds, dependent: :destroy
	has_many :interests, dependent: :destroy
	has_many :cart_cds, dependent: :destroy
	has_many :discs, dependent: :destroy
	has_many :restocks, dependent: :destroy
	attachment :jacket_image
end
