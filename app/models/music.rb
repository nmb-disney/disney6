class Music < ApplicationRecord
	belongs_to :disc

	validates :music_title, presence: true
	validates :music_rank, presence: true
end
