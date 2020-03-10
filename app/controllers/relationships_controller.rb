class RelationshipsController < ApplicationController
  # before_action :logged_in_user

  def create
    user = User.find(params[:follow_user])
    current_user.follow(user)
    redirect_to user
  end
  
  def destroy
    user = Relationship.find(params[:id]).follow_user
    current_user.unfollow(user)
    redirect_to user
  end
  
end