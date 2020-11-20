FactoryBot.define do
  factory :comment do
    item_id { 1 }
    user_id { 1 }
    content { "MyText" }
  end
end
