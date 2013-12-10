class Script < ActiveRecord::Base
  belongs_to :user
  has_many :images

  attr_accessible :content, :title, :user_id, :file_type, :folder_id, :is_private

  def is_private?
    is_private
  end

  def self.default
    <<-Markdown
# Welcome to Mintscript
## A new way to write markdown

[Sign up for a free account](http://http://mint-script.herokuapp.com/users/signup)

## So, what is Markdown?


    Markdown
  end
end