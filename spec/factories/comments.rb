FactoryBot.define do
  factory :comment do
    body { "テストコメント" }
    user_id { 1 }
    board_id { 1 }
    association :user, :board, :notices
  end
end
