class Project < ActiveRecord::Base
  has_many :folders
  accepts_nested_attributes_for :folders
  has_many :scripts, through: :folders
  belongs_to :user

  attr_accessible :name, :user_id
end
