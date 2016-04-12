class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.volunteer?
      can :manage, User, id: user.id
      can :read, Conversation
      can :create, Conversation
      can :update, Conversation
      can :read, Message
      can :create, Message
      can :update, Message
    elsif user.survivor?
      can :read, User, id: user.id
      can :destroy, User, id: user.id
      can :manage, Conversation do |conversation|
        conversation.try(:sender_id) == user.id
      end
      can :read, Message
      can :create, Message
    end
  end
end