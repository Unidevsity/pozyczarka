class CreateFriendship < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.bigint :user_id, null: false, index: true, foreign_key: true
      t.bigint :friend_id, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
