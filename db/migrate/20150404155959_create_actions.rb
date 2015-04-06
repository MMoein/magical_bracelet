class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :color
      t.boolean :shake

      t.timestamps null: false
    end
  end
end
