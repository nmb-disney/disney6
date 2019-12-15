class List < ApplicationRecord
  has_many :artists, dependent: :destroy
  has_many :labels, dependent: :destroy
  has_many :genres, dependent: :destroy
end