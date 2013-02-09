class AddFileTypeToScript < ActiveRecord::Migration
  def up
    add_column :scripts, :file_type, :integer
  end
  
  def down
    remove_column :scripts, :file_type
  end
end
