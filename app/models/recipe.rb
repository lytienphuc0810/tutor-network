class Recipe < ActiveRecord::Base
  attr_accessible :poster_confirmation, :owner_id, :others_id

  belongs_to :owner, :class_name => 'User', :foreign_key => :owner_id
  belongs_to :others, :class_name => 'User', :foreign_key => :others_id

  # Lam nhu the nay de gan
  # r =  Recipe.find....
  # r.tutor = User.find...
  # r.save, phai co
end
