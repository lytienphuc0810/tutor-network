class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.boolean   :poster_confirmation
    	t.integer		:customer_id
    	t.integer 	:tutor_id
      t.timestamps
    end
  end
end
