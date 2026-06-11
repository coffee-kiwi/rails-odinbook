class CreateFollowings < ActiveRecord::Migration[8.1]
  def change
    create_table :followings do |t|
      t.references :followed_users, null: false, foreign_key: { to_table: :users }, index: true
      t.references :followers, null: false, foreign_key: { to_table: :users }, index: true
      
      t.timestamps
    end
  end
end
