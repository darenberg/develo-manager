class AddProjectToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :project, index: true
  end
end
