class Post < ApplicationRecord
  validates :body, presence: :true
  belongs_to :user, inverse_of: :posts

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :avatar
end
