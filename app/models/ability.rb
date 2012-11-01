class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, :all
    can :update, Lessonplan do |lessonplan|
      lessonplan.try(:user) == user
    end

    can :destroy, Lessonplan do |lessonplan| 
      lessonplan.try(:user) == user
    end

    unless user.id.nil? then
      can :create, :all
    end
  end
end
