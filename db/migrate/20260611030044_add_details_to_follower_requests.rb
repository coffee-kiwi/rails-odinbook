class AddDetailsToFollowerRequests < ActiveRecord::Migration[8.1]
  def change
    add_reference :follower_requests, :user, null: false, foreign_key: { to_table: :users }
    add_reference :follower_requests, :recipient, null: false, foreign_key: { to_table: :users }
  end
end
