class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :tasks_users do |t|

      t.integer :user_id
      t.integer :users

      t.integer :task_id
      t.foreign_key :tasks

      t.timestamps null: false
    end

    rename_column :tasks, :user_id, :author_id
  end
end
