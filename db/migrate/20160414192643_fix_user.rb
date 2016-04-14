class FixUser < ActiveRecord::Migration
  def change
    remove_column :users, :email

    change_table(:users) do |t|
      t.string :email,              null: false, default: ""
    end

  end
end
