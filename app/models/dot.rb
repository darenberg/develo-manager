class Dot < ApplicationRecord
  belongs_to :plan
  has_many :tasks
end
