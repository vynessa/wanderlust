class RemoveBudgetFromActivities < ActiveRecord::Migration[5.1]
  def change
    remove_column :activities, :budget, :integer
  end
end
