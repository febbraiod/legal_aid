class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :client_id
      t.string :index_num
      t.string :county
      t.text :caption
      t.boolean :open, default: true

      t.timestamps null: false
    end
  end
end
