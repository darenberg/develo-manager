class Task < ApplicationRecord
  belongs_to :dot
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  has_one_attached :photo
  has_many :tags, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true

  scope :sorted_tasks_by_done, -> { order(done: :asc)}

  # def tag_names=(names)
  #   self.tags = names.split(‘,’).map do |name|
  #     Tag.where(name: name.strip).first_or_create!
  #   end
  # end

  def formatted_tags
    self.tags.map(&:tag_name).join(", ")
  end

  def formatted_tags_with_hashtag
    self.tags.map { |tag| "##{tag.tag_name}" }.join(', ')
  end
end
