class Location < ActiveRecord::Base
  attr_accessible :address, :ward, :city_district, :user_id

  belongs_to :user
end
