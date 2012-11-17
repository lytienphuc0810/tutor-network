class Recipe < ActiveRecord::Base
  attr_accessible :poster_confirmation, :user_id

  has_one :user
  belongs_to :user
end
