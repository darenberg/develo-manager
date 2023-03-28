class AddXPositionToDots < ActiveRecord::Migration[7.0]
  def change
    add_column :dots, :x_position, :float
  end
end
