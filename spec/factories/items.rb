FactoryBot.define do
  factory :item do
    name { "Reiwa Drone" }
    description { "昔買ったドローンです" }
    association :user
    created_at { Time.current }
  end

  trait :keywords do
    keywords_attributes {
                          [
                            { name: "ドローン" },
                            { name: "drone" },
                            { name: "マシン" },
                            { name: "空" },
                            { name: "空撮" },
                            { name: "Drone" },
                            { name: "machine" },
                            { name: "sky" },
                            { name: "air" },
                            { name: "photo" }
                          ]
    }
  end

  trait :yesterday do
    created_at { 1.day.ago }
  end

  trait :one_week_ago do
    created_at { 1.week.ago }
  end

  trait :one_month_ago do
    created_at { 1.month.ago }
  end

  trait :picture do
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_item.jpg')) }
  end
end
