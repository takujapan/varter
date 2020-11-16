FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    popularity { 1 }
    user { nil }
  end
end
