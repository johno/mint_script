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

[Sign up for a free account](http://mint-script.herokuapp.com/users/sign_up)

## What's Markdown?

Markdown is a language that stresses readability over everything else. It is a formatting syntax that can be easily converted to HTML.

### The syntax

# This is an h1
## This is an h2
### This is an h3

    * This is an li element
    * This is another li element


    1. This is an li within an ol
    2. This is another li within an ol
    3. And, yet another.

Just a regular paragraph.

You can also include `inline code` or [links](http://google.com) within your markdown.

```
// This is a block of code
$.fn.awesome = function() {
  // Do stuff...
}
```

  > This is a block quote that is really,
  > really cool.

Get started with Markdown now, it's awesome.


See <http://daringfireball.net/projects/markdown/syntax> for a more thorough description.

    Markdown
  end
end