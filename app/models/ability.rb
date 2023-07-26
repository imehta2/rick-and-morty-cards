# app/models/ability.rb

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user.is_a?(AdminUser)
      can :manage, :all
      cannot :create, AboutUs
      cannot :create, ContactUs
    else
      # Add additional user-based permissions if needed
    end
  end
end
