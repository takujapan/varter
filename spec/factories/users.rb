FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "example#{n}@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
    introduction { "はじめまして！皆さんと仲良くできればと思います。よろしくお願いします。" }

    trait :admin do
      admin { true }
    end
  end
end
