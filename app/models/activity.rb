class Activity < ApplicationRecord
  belongs_to :trip

  validates_presence_of :title,
                        :trip_id
end
