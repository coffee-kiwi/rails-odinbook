class AddStatusToFollowerRequests < ActiveRecord::Migration[8.1]
  def change
    add_column :follower_requests, :status, :integer
  end
end
