class Plan < ApplicationRecord
  STAGES = ["Existing", "Build", "Interior"].freeze
  belongs_to :floor
  has_many :dots, dependent: :destroy
  has_one_attached :photo
end
