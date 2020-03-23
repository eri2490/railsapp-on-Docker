class CommentsController < ApplicationController

  def create
    @post = Post.find_by(id: params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_back(fallback_location: root_path)
    # redirect_to post_path(post.id)
  end

  private

    def comment_params
      params.require(:comment).permit(:comment)
    end

end
