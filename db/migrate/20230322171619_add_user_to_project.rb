class AddUserToProject < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :owner, foreign_key: { to_table: :users }
  end
end
