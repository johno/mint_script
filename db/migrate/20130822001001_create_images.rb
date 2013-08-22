class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :data_file
      t.integer :script_id
      t.string :name

      t.timestamps
    end
  end
end
