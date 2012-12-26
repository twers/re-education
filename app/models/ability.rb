class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Publisher.new # guest user (not logged in)

    can :read, :all
    can :create, Publisher if user.id.nil?
    can :update, Publisher do |publisher|
      publisher == user
    end

    can :update, Lessonplan do |lessonplan|
      lessonplan.try(:publisher) == user
    end

    can :destroy, Lessonplan do |lessonplan| 
      lessonplan.try(:publisher) == user
    end

    can :destroy, Comment do |comment|
      comment.publisher_id == user.id
    end

    unless user.id.nil? then
      can :create, Lessonplan
    end
  end
end
