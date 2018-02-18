class Activity < ApplicationRecord
  belongs_to :trip

  validates_presence_of :title,
                        :status,
                        :trip_id
end
