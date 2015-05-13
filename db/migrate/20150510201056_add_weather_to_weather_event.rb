class AddWeatherToWeatherEvent < ActiveRecord::Migration
  def change
    add_column :weather_events, :weather, :string, :null => false, :default => 'sunny'
  end
end
