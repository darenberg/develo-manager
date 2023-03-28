class RemoveTagsFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :tags, :string
  end
end
