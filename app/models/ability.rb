class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role :moderator
      can :manage, Comment
    else
      can :read, :all
    end
  end
end
