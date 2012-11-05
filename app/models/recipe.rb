class Recipe < ActiveRecord::Base
  attr_accessible :tutor_confirmation, :customer_confirmation, :user_id

  has_one :user
  belongs_to :user
end
