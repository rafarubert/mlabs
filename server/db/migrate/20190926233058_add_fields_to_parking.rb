class AddFieldsToParking < ActiveRecord::Migration[6.0]
  def change
    add_column :parking, :paid, :boolean, default: false
    add_column :parking, :left, :boolean, default: false
    change_table(:parking) { |t| t.timestamps }
  end
end
