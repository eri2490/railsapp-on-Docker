class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @commnet.user_id = current_user.id
    @comment.save
    redirect_back(fallba ck_location: root_path)
  end

  def destroy
    @comment = Comment.find_by(user_id: current_user.id, post_id: params[:post_id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :post_id, :user_id)
    end
    
  
end
