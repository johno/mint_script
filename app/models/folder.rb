class Folder < ActiveRecord::Base
  belongs_to :project
  has_many :scripts

  attr_accessible :name, :project_id
end
