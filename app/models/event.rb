class Event < ActiveRecord::Base
  acts_as_gmappable
  attr_accessible :contact, :desc, :location, :name, :start, :cost, :type
  attr_accessible :address, :prize, :host, :title
  def gmaps4rails_address
self.address #describe how to retrieve the address from your model
end
end
