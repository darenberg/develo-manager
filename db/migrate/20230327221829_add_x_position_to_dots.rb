class AddXPositionToDots < ActiveRecord::Migration[7.0]
  def change
    add_column :dots, :x_position, :float, default: 0
  end
end
