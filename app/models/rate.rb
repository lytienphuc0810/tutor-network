class Rate < ActiveRecord::Base
  attr_accessible :rank, :user_id

  validates :rank, :presence => true
  has_one :user
  belongs_to :user
end
