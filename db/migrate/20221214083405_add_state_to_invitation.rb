class AddStateToInvitation < ActiveRecord::Migration[7.0]
  def change
    add_column :invitations, :state, :string
  end
end
