class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :interests, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :cart_cds, dependent: :destroy
  has_many :addresss, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :lastname_kana, presence: true
  validates :firstname_kana, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :profile_image_id, presence: true
  validates :postalcode, presence: true
  validates :address, presence: true
end
