class Project < ActiveRecord::Base
  has_many :folders
  has_many :scripts, through: :folders
  belongs_to :user
  
  attr_accessible :name
end
