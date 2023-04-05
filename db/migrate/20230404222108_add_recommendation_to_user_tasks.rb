class AddRecommendationToUserTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :user_tasks, :recommendation, :text
  end
end
