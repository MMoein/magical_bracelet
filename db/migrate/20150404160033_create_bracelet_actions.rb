class CreateBraceletActions < ActiveRecord::Migration
  def change
    create_table :bracelet_actions do |t|
      t.integer :color
      t.boolean :shake

      t.timestamps null: false
    end
  end
end
