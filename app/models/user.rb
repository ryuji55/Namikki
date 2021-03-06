class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  enum role: { general: 0, admin: 1 }

  has_many :boards, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_boards, through: :favorites, source: :board
  has_many :comments, dependent: :destroy
  has_many :active_notices, class_name: 'Notice', foreign_key: 'visitor_id', dependent: :destroy, inverse_of: 'visitor'
  has_many :passive_notices, class_name: 'Notice', foreign_key: 'visited_id', dependent: :destroy, inverse_of: 'visited'

  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :reason, length: { maximum: 150 }

  def own?(object)
    id == object.user_id
  end

  def favorite?(board)
    favorite_boards.include?(board)
  end
end
