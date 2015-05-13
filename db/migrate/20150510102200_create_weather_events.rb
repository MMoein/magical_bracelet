class CreateWeatherEvents < ActiveRecord::Migration
  def change
    create_table :weather_events do |t|
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
