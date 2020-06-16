FactoryBot.define do
  factory :delivery_information do
    family_name { "山田" }
    first_name { "太郎" }
    family_name_kana { "ヤマダ" }
    first_name_kana { "タロウ" }
    postal_code { 123456 }
    state { "東京都" }
    city { "六本木" }
    address_line_1 { "1-1" }
    user
  end
end
