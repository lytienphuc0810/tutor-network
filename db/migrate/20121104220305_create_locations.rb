class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.string :address
    	t.string :ward
    	t.string :city_district
    	t.integer :user_id
      t.timestamps
    end
  end
end
