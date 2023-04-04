class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_tasks
  has_many :project_users

  def belongs_to_task?(task)
    user_tasks.where(task: task).present?
  end

  def user_task(task)
    user_tasks.where(task: task).first
  end
end
