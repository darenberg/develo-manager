class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.references :floor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
