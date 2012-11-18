class Location < ActiveRecord::Base
  attr_accessible :address, :ward, :district, :city_province, :user_id
  validates :district, :city_province, :presence => true

  belongs_to :user
end
