class Notice < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :board, optional: true
  belongs_to :comment, optional: true

  belongs_to :visitor, class_name: 'User', optional: true, inverse_of: 'active_notices'
  belongs_to :visited, class_name: 'User', optional: true, inverse_of: 'passive_notices'
end
