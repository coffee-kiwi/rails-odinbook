class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, inverse_of: :likes
end
