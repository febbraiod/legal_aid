class AddExposureToCases < ActiveRecord::Migration
  def change
    add_column :cases, :exposure, :integer
  end
end
