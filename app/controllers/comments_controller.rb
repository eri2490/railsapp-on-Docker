class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @post = Post.find_by(id: params[:post_id])
    byebug
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    # @comment.save     // comment-out for form
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  private

    def comment_params
      params.require(:comment).permit(:comment)
    end

end
