class CreateTutorPosts < ActiveRecord::Migration
  def change
    create_table :tutor_posts do |t|
    	t.text :content
    	t.string :subject
    	t.string :experience
      t.string :address
      t.string :district
      t.string :city_province
    	t.string :tutor_fee
      t.boolean :allowed
    	t.integer :user_id
      t.timestamps
    end
  end
end
