class Board < ApplicationRecord
  belongs_to :user
  mount_uploader :image, AvatarUploader

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_many :comments, dependent: :destroy
end
