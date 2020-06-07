class DeliveryInformation < ApplicationRecord
  belongs_to :user

  validates :family_name,:first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :family_name_kana,:first_name_kana, presence: true, format: {with: /\A[ぁ-んァ-ヶー－]+\z/}
  validates :postal_code,:state,:city,:address_line_1, presence: true

end
