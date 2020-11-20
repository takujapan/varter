FactoryBot.define do
  factory :comment do
    user_id { 1 }
    content { "素敵ですね" }
    association :item
  end
end
