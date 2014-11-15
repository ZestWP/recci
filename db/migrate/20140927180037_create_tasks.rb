class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :due_on
      t.integer :type

      t.timestamps
    end
  end
end
