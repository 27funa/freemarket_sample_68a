FactoryBot.define do
  factory :delivery_information do
    family_name { "MyString" }
    first_name { "MyString" }
    family_name_kana { "MyString" }
    first_name_kana { "MyString" }
    postal_code { 1 }
    state { "MyString" }
    city { "" }
    address_line_1 { "MyString" }
    address_line_2 { "MyString" }
    tel { 1 }
    user { nil }
  end
end
