class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  has_many :comments, through: :posts, dependent: :destroy
  has_many :likes, through: :posts, dependent: :destroy

  # has_many :followers
  has_many :follower_requests
  has_many :recipients, class_name: "User", foreign_key: :recipient_id
end
