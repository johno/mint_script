class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, :all
      can :manage, Script, user_id: nil
      cannot :read, Script, is_private: true
    else
      can :read, :all
      can :manage, Image, user: user
      cannot :manage, Script, is_private: true
      can :manage, Script, user_id: user.id
      can :manage, User, id: user.id
      can [:followers, :followed], User
      can :manage, Relationship, follower_id: user.id
      can :read, Relationship
    end
  end
end
