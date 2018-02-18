class BudgetItem < ApplicationRecord
  belongs_to :trip

  validates_presence_of :item,
                        :description,
                        :cost,
                        :trip_id
end
