class Event < ActiveRecord::Base
  acts_as_gmappable :latitude => 'lat', :longitude => 'lng', :process_geocoding => :geocode?,
                  :address => "address", :normalized_address => "address",
                  :msg => "Sorry, not even Google could figure out where that is"
  attr_accessible :contact, :desc, :location, :name, :start, :cost, :cat
  attr_accessible :address, :prize, :host, :title, :latitudem, :longitude
  geocoded_by :address 
  after_validation :geocode, :if => :address_changed?
  def gmaps4rails_address
    self.address #describe how to retrieve the address from your model
    end
    def geocode?
  (!address.blank? && (latitude.blank? || longitude.blank?)) || address_changed?
end
end
