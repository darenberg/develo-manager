class AddFloorNumberToFloor < ActiveRecord::Migration[7.0]
  def change
    add_column :floors, :fieldname, :integer
  end
end
