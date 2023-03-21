class CreateDots < ActiveRecord::Migration[7.0]
  def change
    create_table :dots do |t|
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
