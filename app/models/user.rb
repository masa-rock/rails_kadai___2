class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 画像登録機能の追加
  has_one_attached :avatar
  # roomとのdb関連付け
  has_many :rooms
  # room_usersとdb関連付け
  has_many :room_users ,dependent: :destroy
  has_many :users, through: :room_users
end
