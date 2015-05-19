class CreateCustomEvents < ActiveRecord::Migration
  def change
    create_table :custom_events do |t|
      t.string :token
      t.string :color

      t.timestamps null: false
    end
  end
end
