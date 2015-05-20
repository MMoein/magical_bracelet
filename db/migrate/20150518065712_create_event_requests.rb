class CreateEventRequests < ActiveRecord::Migration
  def change
    create_table :event_requests do |t|
      t.references :User
      t.references :CustomEvent
      t.boolean :is_used
      t.timestamps null: false
    end
  end
end
