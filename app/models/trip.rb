class Trip < ApplicationRecord
  belongs_to :user
  has_many :activities
  has_many :budget_items

  validates_presence_of :name,
                        :description,
                        :user_id,
                        :location,
                        :departure_date,
                        :return_date
end
