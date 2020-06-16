class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..128
  has_one :credit, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :user_information, dependent: :destroy
  has_one :delivery_information, dependent: :destroy

  validates :nickname, presence: true, uniqueness: true

  has_many :posts
end
