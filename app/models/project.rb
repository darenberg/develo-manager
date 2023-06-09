class Project < ApplicationRecord
  has_many :users
  belongs_to :owner, class_name: "User"
  has_many :floors
  has_many :plans, through: :floors
  has_many :dots, through: :plans
  has_many :tasks, through: :dots

  has_many :tags, through: :tasks
  has_many :project_users, dependent: :destroy


  def floor_numbers
    floors.pluck(:number).sort
  end
end
