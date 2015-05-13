class WeatherEvent < ActiveRecord::Base
  # attr_accessible :country, :city
  belongs_to :Rule
end
