class Event < ActiveRecord::Base
  attr_accessible :contact, :desc, :location, :name, :start, :cost, :type
  attr_accessible :address, :prize, :host
end
