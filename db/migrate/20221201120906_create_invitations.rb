class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.bigint :invited_by_id, index: true, null: false, foreign_key: true
      t.bigint :invited_id, index: true, null: false, foreign_key: true
      t.timestamps
    end
  end
end
