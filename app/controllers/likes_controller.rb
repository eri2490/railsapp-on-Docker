class LikesController < ApplicationController
  before_action :logged_in_user
  
  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.build(post_id: params[:post_id])
    like.save
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end
    
  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(user_id: current_user.id,
                         post_id: params[:post_id])
    @like.destroy
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end
    
end