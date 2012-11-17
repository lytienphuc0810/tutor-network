class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string 		:username
    	t.boolean  	:gender
    	t.string		:role
      t.timestamps  
    end
  end
end
