FactoryBot.define do
  factory :user_information do
    family_name { "山田" }
    first_name { "太郎" }
    family_name_kana { "ヤマダ" }
    first_name_kana { "タロウ" }
    birth { "2020-02-02"}
    postal_code { 123456 }
    state { "東京都" }
    city { "六本木" }
    address_line_1 { "1-1" }
    address_line_2 { "710" }
    user
  end
end
