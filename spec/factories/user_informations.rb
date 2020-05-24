FactoryBot.define do
  factory :user_information do
    family_name { "MyString" }
    first_name { "MyString" }
    family_name_kana { "MyString" }
    first_name_kana { "MyString" }
    birth { "2020-05-23" }
    postal_code { 1 }
    state { "MyString" }
    city { "MyString" }
    address_line_1 { "MyString" }
    address_line_2 { "MyString" }
    user { nil }
  end
end
