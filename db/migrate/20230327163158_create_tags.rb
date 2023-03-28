class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
