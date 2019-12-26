class Disc < ApplicationRecord
	belongs_to :cd
	has_many :musics

	 accepts_nested_attributes_for :musics, allow_destroy: true
     validates :disc_rank, presence: true
     validates :disc_title, presence: true
end
