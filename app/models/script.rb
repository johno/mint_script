class Script < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :file_type

  def is_private?
    is_private
  end
end