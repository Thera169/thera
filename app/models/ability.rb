class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.volunteer?
      can :manage, User, id: user.id
      can :read, Conversation
      can :update, Conversation
      can :read, Message
      can :create, Message
      can :update, Message
    elsif user.survivor?
      can :manage, Conversation do |conversation|
        conversation.try(:user) == user
      end
      can :read, Message
      can :create, Message
    end
  end
end