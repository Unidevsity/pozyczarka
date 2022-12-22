class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :receipient_id, null: false, index: true, foreign_key: true
      t.integer :sender_id, null: false, index: true, foreign_key: true
      t.text :body
      t.datetime :read_at

      t.timestamps
    end
  end
end
