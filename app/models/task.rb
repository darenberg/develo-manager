class Task < ApplicationRecord
  belongs_to :dot
  has_many :user_tasks, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :content, presence: true
  validates :tags, presence: true
end
