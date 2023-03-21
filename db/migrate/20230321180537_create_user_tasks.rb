class CreateUserTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tasks do |t|

      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
