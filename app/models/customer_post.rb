class CustomerPost < ActiveRecord::Base
  attr_accessible :content, :experience, :tutor_fee, :subject

  self.per_page = 5
  belongs_to :user
end
