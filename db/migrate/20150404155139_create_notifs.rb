class CreateNotifs < ActiveRecord::Migration
  def change
    create_table :notifs do |t|
      t.datetime :date
      t.integer :rule_id

      t.timestamps null: false
    end
  end
end
