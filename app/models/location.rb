class Location < ActiveRecord::Base
  attr_accessible :address, :ward, :district, :city_province, :user_id

  belongs_to :user
end
