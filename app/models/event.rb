class Event < ActiveRecord::Base
 
  attr_accessible :contact, :desc, :location, :name, :start, :cost, :cat, :dayof
  attr_accessible :address, :prize, :host, :title, :latitudem, :longitude,:website
  geocoded_by :address 
  after_validation :geocode, :if => :address_changed?
  def gmaps4rails_address
    self.address #describe how to retrieve the address from your model
    end
    def geocode?
  (!address.blank? && (latitude.blank? || longitude.blank?)) || address_changed?
end
end
