FactoryBot.define do
  factory :board do
    point { "ロングビーチ" }
    wave_size { "フラット" }
    sequence(:user_id, "1")
    association :user
  end
end
