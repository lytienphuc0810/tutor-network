class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string 		:username
    	t.boolean  	:gender
    	t.string		:address
    	t.string		:ward
    	t.string		:street
    	t.string		:district
    	t.string		:city_province
    	t.string		:role
      t.timestamps  
    end
  end
end
