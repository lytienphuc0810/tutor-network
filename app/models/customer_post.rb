class CustomerPost < ActiveRecord::Base
  attr_accessible :content, :user_id

  self.per_page = 5
  belongs_to :user
end
