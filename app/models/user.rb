class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :credit, dependent: :destroy
  has_one :profile, dependent: :destroy
         :recoverable, :rememberable, :validatable, password_length: 7..128
  

  validates :nickname, presence: true, uniqueness: true
end
