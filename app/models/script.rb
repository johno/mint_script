class Script < ActiveRecord::Base
  belongs_to :user

  attr_accessible :content, :title, :user_id, :file_type, :image

  mount_uploader :image, ImageUploader

  def is_private?
    is_private
  end
end