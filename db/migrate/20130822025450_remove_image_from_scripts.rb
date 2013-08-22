class RemoveImageFromScripts < ActiveRecord::Migration
  def up
    remove_column :scripts, :image
  end

  def down
    add_column :scripts, :image, :string
  end
end
