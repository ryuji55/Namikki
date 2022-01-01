FactoryBot.define do
  factory :board do
    point { "ロングビーチ" }
    wave_size { "フラット" }
    user_id { 1 }
    association :user
  end
end
