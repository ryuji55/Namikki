FactoryBot.define do
  factory :user do
    name { "namikki" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    reason { "楽しかったから" }
    role { 0 }
    sequence(:id, "1")
  end
end
