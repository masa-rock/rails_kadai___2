class Room < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users
end
