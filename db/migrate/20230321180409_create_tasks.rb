class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :content
      t.string :tags
      t.string :title
      t.references :dot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
