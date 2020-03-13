class RelationshipsController < ApplicationController
  # before_action :logged_in_user

  def create
    @user = User.find(params[:follow_user])
    current_user.follow(@user)
    respond_to do |format|
      format.html { rediredt_to @user}
      format.js
    end
    # redirect_to user
  end
  
  def destroy
    user = Relationship.find(params[:id]).follow_user
    current_user.unfollow(user)
    respond_to do |format|
      format.html { rediredt_to @user}
      format.js
    end
    # redirect_to user
  end
  
end