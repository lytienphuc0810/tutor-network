class Recipe < ActiveRecord::Base
  attr_accessible :poster_confirmation, :tutor_id, :customer_id

  has_one :user
  belongs_to :tutor, :class_name => 'User'
  belongs_to :customer, :class_name => 'User'
  self.per_page = 12
  # Lam nhu the nay de gan
  # r =  Recipe.find....
  # r.tutor = User.find...
  # r.save, phai co
end
