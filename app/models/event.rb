class Event < ActiveRecord::Base
 
  attr_accessible :contact, :desc, :location, :maker, :start, :cost, :cat, :dayof
  attr_accessible :address, :prize, :host, :title, :latitudem, :longitude,:website
  attr_accessible :approve 
  geocoded_by :address 
  validates :title,   :maker, :cat, :presence => true
  after_validation :geocode, :if => :address_changed?
  def gmaps4rails_address
    self.address #describe how to retrieve the address from your model
    end
    def geocode?
  (!address.blank? && (latitude.blank? || longitude.blank?)) || address_changed?
end
end
