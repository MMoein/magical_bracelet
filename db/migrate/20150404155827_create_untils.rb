class CreateUntils < ActiveRecord::Migration
  def change
    create_table :untils do |t|
      t.integer :rule_id

      t.timestamps null: false
    end
  end
end
