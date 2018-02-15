class CreateBudgetItems < ActiveRecord::Migration[5.1]
  def change
    create_table :budget_items do |t|
      t.string :item
      t.text :description
      t.integer :cost
      t.integer :trip_id

      t.timestamps
    end
  end
end
