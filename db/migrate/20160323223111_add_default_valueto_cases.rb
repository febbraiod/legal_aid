class AddDefaultValuetoCases < ActiveRecord::Migration
  def change
    change_column :cases, :open, :boolean, :default => true
  end
end
