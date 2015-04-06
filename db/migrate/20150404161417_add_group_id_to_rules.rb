class AddGroupIdToRules < ActiveRecord::Migration
  def change
  	add_column :rules, :group_id, :integer, :uniq => true
  	add_index :rules, :group_id

  end
end
