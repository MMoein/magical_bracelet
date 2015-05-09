class AddConsumedToNotifs < ActiveRecord::Migration
  def change
    add_column :notifs, :is_consumed, :boolean
  end
end
