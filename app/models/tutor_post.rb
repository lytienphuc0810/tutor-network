class TutorPost < ActiveRecord::Base
  attr_accessible :content, :experience, :address, :district, :city_province, :tutor_fee, :subject, :user_id
  validates :subject, :content, :tutor_fee, :experience, :presence => true

	self.per_page = 5
  belongs_to :user
	
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
end
