class TutorPost < ActiveRecord::Base
  attr_accessible :content, :experience, :address, :district, :city_province, :tutor_fee, :subject, :user_id, :allowed
  validates :subject, :content, :tutor_fee, :experience, :presence => true
  before_validation :default_allowed

	self.per_page = 5
  belongs_to :user
  has_one :recipe
	
	ATTRS = [:subject, :experience, :address, :district, :city_province, :tutor_fee]
	
	searchable do
    text :subject, :experience, :address, :district, :city_province, :tutor_fee 
  end

	def self.mysearch params
		TutorPost.reindex
		TutorPost.search do
      ATTRS.each do |element|
        if params[element]
          fulltext params[element] do
            fields(element)
          end
        end
      end
		end.results
	end

  def default_allowed
    self.allowed = false
  end 
end
