class Folder < ActiveRecord::Base
  belongs_to :project
  has_many :scripts
  accepts_nested_attributes_for :scripts, reject_if: lambda { |a| a[:content].blank? }, allow_destroy: true

  attr_accessible :name, :project_id, :scripts_attributes
end
