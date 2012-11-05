class Rate < ActiveRecord::Base
  attr_accessible :rank, :user_id

  has_one :user
  belongs_to :user
end
