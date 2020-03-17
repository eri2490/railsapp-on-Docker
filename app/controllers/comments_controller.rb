class CommentsController < ApplicationController

  def create
    # @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.save
    # redirect_back(fallback_location: root_path)
    redirect_to post_path(post.id)
  end

  private

    def comment_params
      params.require(:comment).permit(:comment, :post_id, :user_id)
    end

end
