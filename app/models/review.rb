class Review < ApplicationRecord
	validates :comment, length: { maximum: 30 }
	belongs_to :cd
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
end
