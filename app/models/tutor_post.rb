class TutorPost < ActiveRecord::Base
  attr_accessible :content, :experience, :tutor_fee, :subject, :user_id
  validates :subject, :content, :tutor_fee, :experience, :presence => true

	self.per_page = 5
  belongs_to :user
end
