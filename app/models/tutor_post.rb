class TutorPost < ActiveRecord::Base
  attr_accessible :content, :experience, :tutor_fee, :subject, :user_id

	self.per_page = 5
  belongs_to :user
end
