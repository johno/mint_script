class AddPrivateBooleanToScripts < ActiveRecord::Migration
  def change
    add_column :scripts, :is_private, :boolean
  end
end
