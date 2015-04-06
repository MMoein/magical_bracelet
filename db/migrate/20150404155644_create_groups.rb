class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :membership_id

      t.timestamps null: false
    end
  end
end
