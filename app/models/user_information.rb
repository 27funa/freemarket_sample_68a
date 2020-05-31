class UserInformation < ApplicationRecord
  belongs_to :user

  validates :family_name,:first_name, presence: true, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :family_name_kana,:first_name_kana, presence: true, format: {with: /\A[ぁ-んァ-ヶー－]+\z/}
  validates :birth,:postal_code,:state,:city,:address_line_1, presence: true
end
