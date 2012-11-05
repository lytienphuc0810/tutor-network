class CreateCustomerPosts < ActiveRecord::Migration
  def change
    create_table :customer_posts do |t|
    	t.string :content
      t.timestamps
    end
  end
end
