class Pickup < ActiveRecord::Base
  attr_accessible :name,:rate, :now, :home, :current, :long, :lat, :end_lat, :end_long,:ip
  geocoded_by :address, :latitude  => :end_lat, :longitude => :end_long
after_validation :geocode 
end
