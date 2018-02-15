class Trip < ApplicationRecord
  belongs_to :user
  has_many :activities
  has_many :budget_items
end
