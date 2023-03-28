class Task < ApplicationRecord
  belongs_to :dot
  has_many :user_tasks, dependent: :destroy
  has_one_attached :photo
  has_many :tags,dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
end
