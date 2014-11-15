class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :title
      t.integer :permission

      t.timestamps
    end
  end
end
