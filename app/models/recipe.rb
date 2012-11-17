class Recipe < ActiveRecord::Base
  attr_accessible :poster_confirmation, :tutor_id, :customer_id

  has_one :user
  belongs_to :tutor, :class_name => 'User', :foreign_key => :tutor_id
  belongs_to :customer, :class_name => 'User', :foreign_key => :customer_id
end
