FactoryBot.define do
  factory :comment do
    body { "テストコメント" }
    sequence(:user_id, "1")
    sequence(:board_id, "1")
    association :user
    association :board
  end
end
