class TutorPost < ActiveRecord::Base
  attr_accessible :content, :experience, :address, :district, :city_province, :tutor_fee, :subject, :user_id
  validates :subject, :content, :tutor_fee, :experience, :presence => true

	self.per_page = 5
  belongs_to :user
  has_one :recipe


end
