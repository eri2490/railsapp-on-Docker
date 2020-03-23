class LikesController < ApplicationController

    def create
      @like = current_user.likes.build(post_id: params[:post_id])
      @like.save
      # Comment out for Ajax(https://qiita.com/naberina/items/c6b5c8d7756cb882fb20)
      # respond_to do |format|
      #   format.html { redirect_to like }
      #   format.js
      # end
    end
    
    def destroy
      @like = Like.find_by(user_id: current_user.id,
                           post_id: params[:post_id])
      @like.destroy
      # Comment out for Ajax(https://qiita.com/naberina/items/c6b5c8d7756cb882fb20)
      # respond_to do |format|
      #   format.html { redirect_to @like }
      #   format.js
      # end
    end
    
end