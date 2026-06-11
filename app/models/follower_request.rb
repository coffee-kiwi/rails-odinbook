class FollowerRequest < ApplicationRecord
  belongs_to :user

  enum :status, { rejected: 0, pending: 1, accepted: 2 }
end
