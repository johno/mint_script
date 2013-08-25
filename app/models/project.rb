class Project < ActiveRecord::Base
  has_many :folders
  accepts_nested_attributes_for :folders, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true
  has_many :scripts, through: :folders
  belongs_to :user

  attr_accessible :name, :user_id, :folders_attributes
end
