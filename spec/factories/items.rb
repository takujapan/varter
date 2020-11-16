FactoryBot.define do
  factory :item do
    name { Faker::Items.item }
    description { "買ったけど、一回も使っていません" }
    association :user
  end
end
