class CreateCustomerPosts < ActiveRecord::Migration
  def change
    create_table :customer_posts do |t|
    	t.text :content
    	t.string :subject
    	t.string :experience
      t.string :district
      t.string :city_province
    	t.string :tutor_fee
    	t.integer :user_id
      t.timestamps
    end
  end
end
