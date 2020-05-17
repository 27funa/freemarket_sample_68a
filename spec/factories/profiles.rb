FactoryBot.define do
  factory :profile do
    introduction { "MyText" }
    image { "MyString" }
    user { nil }
  end
end
