class RenameTodoItemToActivity < ActiveRecord::Migration[5.1]
  def change
    rename_table :todo_items, :activities
  end
end
