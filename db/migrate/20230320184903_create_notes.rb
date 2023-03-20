class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :content
      t.string :tag
      t.string :title
      t.string :category

      t.timestamps
    end
  end
end
