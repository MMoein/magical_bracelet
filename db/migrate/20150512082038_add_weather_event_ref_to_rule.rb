class AddWeatherEventRefToRule < ActiveRecord::Migration
  def change
    add_reference :rules, :weather_events, index: true
    add_foreign_key :rules, :weather_events
  end
end
