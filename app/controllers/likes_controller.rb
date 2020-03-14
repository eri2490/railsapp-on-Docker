class LikesController < ApplicationController

    def create
      @like = current_user.likes.create(post_id: params[:post_id])
      # respond_to do |format|
      #   format.html { redirect_back(fallback_location: root_path)}
      #   format.js
      # end
      redirect_back(fallback_location: root_path)
    end
    
    def destroy
      byebug
      @like = Like.find_by(user_id: current_user.id,
                           post_id: params[:post_id])
      @like.destroy
      # respond_to do |format|
      #   format.html { redirect_back(fallback_location: root_path)}
      #   format.js
      # end
      redirect_back(fallback_location: root_path)
    end
    
end