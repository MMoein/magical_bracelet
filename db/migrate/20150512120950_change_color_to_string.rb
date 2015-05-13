class ChangeColorToString < ActiveRecord::Migration
  def change
    add_column :actions, :colour, :string
    remove_column :actions, :color
  end
end
