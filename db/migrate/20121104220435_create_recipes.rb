class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.boolean   :poster_confirmation
    	t.integer		:others_id
    	t.integer 	:owner_id
      t.timestamps
    end
  end
end
