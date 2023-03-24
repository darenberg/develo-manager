class Floor < ApplicationRecord
  belongs_to :project
  has_many :plans, dependent: :destroy
end
