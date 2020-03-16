class LikesController < ApplicationController

    def create
      @like = current_user.likes.build(post_id: params[:post_id])
      @like.save
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    end
    
    def destroy
      @like = Like.find_by(user_id: current_user.id,
                           post_id: params[:post_id])
      @like.destroy
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    end
    
end