class CustomerPost < ActiveRecord::Base
  attr_accessible :content, :experience, :street, :district, :city_province, :tutor_fee, :subject, :user_id
  validates :subject, :content, :tutor_fee, :experience, :presence => true

  self.per_page = 5
  belongs_to :user

  def initialize_location
  	if !self.user.nil?
  		street = self.user.street
  		district = self.user.district
  		city_province = self.user.city_province
  	end
  end
end
