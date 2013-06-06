class Ability
  include CanCan::Ability

  def initialize(user)


    unless user
      can :read, :all
    else
    	can :create, Post
    	can :manage, Post do |p|
    		p.try(:user) == user 
    	end 

		can :read, :all
		if user.is_admin?
			can :manage, :all
		end
    
	end
  end
end

 