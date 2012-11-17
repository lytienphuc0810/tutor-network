class CreateTutorPosts < ActiveRecord::Migration
  def change
    create_table :tutor_posts do |t|
    	t.string :content
    	t.string :subject
    	t.string :experience
    	t.string :tutor_fee
    	t.integer :user_id
      t.timestamps
    end
  end
end
