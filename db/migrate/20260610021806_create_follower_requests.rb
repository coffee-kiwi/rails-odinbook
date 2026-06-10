class CreateFollowerRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :follower_requests do |t|
      t.timestamps
    end
  end
end
