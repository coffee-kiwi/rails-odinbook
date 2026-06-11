class DropFollowersTable < ActiveRecord::Migration[8.1]
  def change
    drop_table :followers do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
