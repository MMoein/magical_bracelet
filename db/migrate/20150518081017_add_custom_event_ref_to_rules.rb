class AddCustomEventRefToRules < ActiveRecord::Migration
  def change
    add_reference :rules, :custom_events, index: true
    add_foreign_key :rules, :custom_events
  end
end
