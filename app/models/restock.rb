class Restock < ApplicationRecord
	belongs_to :cd

	validates :restock_date, presence: true
	validates :restock_count, presence: true
end

