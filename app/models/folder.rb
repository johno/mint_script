class Folder < ActiveRecord::Base
  belongs_to :project
  has_many :scripts
  accepts_nested_attributes_for :scripts

  attr_accessible :name, :project_id
end
