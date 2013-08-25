class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :scripts
  has_many :projects
  has_many :folders, through: :projects

  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  has_many :reverse_relationships, foreign_key: :followed_id, class_name: :Relationship, dependent: :destroy
  
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :followed_users, through: :relationships, source: :followed

  def following?(other_user)
    relationships.where(followed_id: other_user.id).any?
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.where(followed_id: other_user.id).first.destroy
  end
end