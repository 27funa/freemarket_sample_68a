class UserInformation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :state
  
  belongs_to :user
  
  validates :family_name,:first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :family_name_kana,:first_name_kana, presence: true, format: {with: /\A[ぁ-んァ-ヶー－]+\z/}
  validates :birth,:postal_code,:state_id,:city,:address_line_1, presence: true
end
