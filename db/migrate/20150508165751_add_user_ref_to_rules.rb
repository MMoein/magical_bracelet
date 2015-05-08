class AddUserRefToRules < ActiveRecord::Migration
  def change
    add_reference :rules, :user, index: true
    add_foreign_key :rules, :users
  end
end
