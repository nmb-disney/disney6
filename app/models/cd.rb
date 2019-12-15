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
	Benchmark.bmbm do |results|
 accepts_nested_attributes_for :discs, allow_destroy: true


	end
end
