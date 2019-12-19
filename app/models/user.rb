class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :interests, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :cart_cds, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :lastname, presence: true, length: {in: 1..20}
  validates :firstname, presence: true, length: {in: 1..20}
  validates :lastname_kana, presence: true, length: {in: 1..20}
  validates :firstname_kana, presence: true, length: {in: 1..20}
  validates :phone, presence: true, length: {in: 1..20}
  validates :email, presence: true
  validates :postalcode, presence: true
  validates :address, length: { maximum: 50 }
  attachment :profile_image

  acts_as_paranoid
end
