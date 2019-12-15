class Genre < ApplicationRecord
	has_many :cds, dependent: :destroy
	belongs_to :list
end
