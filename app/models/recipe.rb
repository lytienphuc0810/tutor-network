class Recipe < ActiveRecord::Base
  attr_accessible :poster_confirmation, :owner_id, :other_id, :tutor_post_id, :customer_post_id

  has_one :user
  belongs_to :owner, :class_name => 'User', :foreign_key => :owner_id
  belongs_to :other, :class_name => 'User', :foreign_key => :other_id
  belongs_to :tutor_post
  belongs_to :customer_post
  self.per_page = 12

  # Lam nhu the nay de gan
  # r =  Recipe.find....
  # r.tutor = User.find...
  # r.save, phai co
end
