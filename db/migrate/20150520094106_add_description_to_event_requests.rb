class AddDescriptionToEventRequests < ActiveRecord::Migration
  def change
    add_column :event_requests, :description, :string
  end
end
