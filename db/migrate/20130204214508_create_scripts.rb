class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :title
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
