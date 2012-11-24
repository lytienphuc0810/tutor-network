class CustomerPost < ActiveRecord::Base
  attr_accessible :content, :experience, :district, :city_province, :tutor_fee, :subject, :user_id, :published, :allowed
  validates :subject, :content, :tutor_fee, :experience, :presence => true
  before_validation :default_allowed

  self.per_page = 5
  belongs_to :user
  has_many :recipes

	ATTRS = [:subject, :experience, :district, :city_province, :tutor_fee]
	
	searchable do
    text :subject, :experience, :district, :city_province, :tutor_fee 
  end

	def self.mysearch params
		CustomerPost.reindex
		CustomerPost.search do
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
