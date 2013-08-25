class Project < ActiveRecord::Base
  has_many :folders
  has_many :scripts, through: :folders
  attr_accessible :name
end
