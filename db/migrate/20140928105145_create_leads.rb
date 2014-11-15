class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :company
      t.integer :interested
      t.integer :status
      t.integer :source
      t.text :company
      t.text :address

      t.timestamps
    end
  end
end
