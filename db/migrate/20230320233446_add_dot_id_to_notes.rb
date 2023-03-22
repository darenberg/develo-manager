class AddDotIdToNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :dot_id, :integer
  end
end
