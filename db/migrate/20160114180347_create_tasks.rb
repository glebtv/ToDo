class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :content

      t.integer :user_id
      t.foreign_key :users

      t.timestamps null: false
    end
  end
end
