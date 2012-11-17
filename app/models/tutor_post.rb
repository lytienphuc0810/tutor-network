class TutorPost < ActiveRecord::Base
  attr_accessible :content, :user_id

	self.per_page = 12
  belongs_to :user
end
