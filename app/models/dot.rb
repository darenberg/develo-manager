class Dot < ApplicationRecord
  belongs_to :plan
  has_many :tasks, dependent: :destroy
end
