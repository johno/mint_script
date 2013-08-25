class AddFolderIdToScripts < ActiveRecord::Migration
  def change
    add_column :scripts, :folder_id, :integer
  end
end
