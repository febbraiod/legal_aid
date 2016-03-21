class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :home_phone
      t.string :work_phone
      t.string :cell_phone
      t.string :email
      t.text :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
