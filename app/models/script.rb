class Script < ActiveRecord::Base
  belongs_to :user
  has_many :images

  attr_accessible :content, :title, :user_id, :file_type, :image

  def is_private?
    is_private
  end
end