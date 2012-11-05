class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.boolean   :tutor_confirmation
    	t.boolean   :customer_confirmation
      t.timestamps
    end
  end
end
