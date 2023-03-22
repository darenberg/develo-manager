class Project < ApplicationRecord
  has_many :users
  belongs_to :owner, class_name: "User"
  has_many :floors
  has_many :plans, through: :floors
  has_many :dots, through: :plans
  has_many :tasks, through: :dots
end
