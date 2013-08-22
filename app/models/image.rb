class Image < ActiveRecord::Base
  belongs_to :script
  has_one :user, through: :script

  attr_accessible :name, :data_file, :script_id
  
  mount_uploader :data_file, DataFileUploader
end
