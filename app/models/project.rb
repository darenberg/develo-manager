class Project < ApplicationRecord
  has_many :users
  has_many :floors
  belongs_to :owner, class_name: "User"
end
