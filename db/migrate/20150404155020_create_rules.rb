class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.integer :bracelet_id
      t.integer :action_id
      t.integer :event_id
      t.integer :until_id

      t.timestamps null: false
    end
  end
end
