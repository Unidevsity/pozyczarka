class AddBorrowedFieldsToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :borrowed_to_id, :integer, foreign_key: true
    add_column :items, :borrowed_at, :datetime
  end
end
