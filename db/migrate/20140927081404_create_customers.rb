class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :contact
      t.string :website

      t.timestamps
    end
  end
end
