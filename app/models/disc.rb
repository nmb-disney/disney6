class Disc < ApplicationRecord
	belongs_to :cd
	has_many :musics, dependent: :destroy
end
