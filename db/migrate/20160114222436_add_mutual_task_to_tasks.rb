class AddMutualTaskToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :mutual_task, :boolean, default: false
  end
end
