class CreateTodoItems < ActiveRecord::Migration[5.1]
  def change
    create_table :todo_items do |t|
      t.string :title
      t.boolean :status
      t.integer :trip_id
      t.integer :budget

      t.timestamps
    end
  end
end
