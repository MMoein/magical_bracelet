class CreateBracelets < ActiveRecord::Migration
  def change
    create_table :bracelets do |t|
      t.integer :color
      t.references :user, index: true
      t.boolean :is_shaking

      t.timestamps null: false
    end
    add_foreign_key :bracelets, :users
  end
end
