class AddYPositionToDots < ActiveRecord::Migration[7.0]
  def change
    add_column :dots, :y_position, :float
  end
end
