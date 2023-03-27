class Task < ApplicationRecord
  belongs_to :dot
  has_many :user_tasks, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :content, presence: true
  validates :tags, presence: true

  scope :sorted_tasks_by_done, -> { order(done: :asc)}
end
