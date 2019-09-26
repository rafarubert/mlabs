class CreateParking < ActiveRecord::Migration[6.0]
  def change
    create_table :parking do |t|
      t.string :plate
    end
  end
end
