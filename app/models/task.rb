class Task < ApplicationRecord
  belongs_to :dot
  has_many :user_tasks
end
