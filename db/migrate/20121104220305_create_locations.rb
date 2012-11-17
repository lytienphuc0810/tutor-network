class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.string :address
    	t.string :ward
    	t.string :district
    	t.string :city_province
    	t.integer :user_id
      t.timestamps
    end
  end
end
