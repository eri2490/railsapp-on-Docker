class PostsController < ApplicationController
  # before_action :authenticate_user
  
  def index
    @posts = Post.paginate(page: params[:page]).order(created_at: :desc)
    @post = Post.find_by(id: params[:id])
    # @user = User.find(params[:id])    // Comment out for Like model
    # @comments = @post.comments        // Comment out for Like model
    # @user = @post.user
    @like = Like.new
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success]  = "Posted!!!"
      redirect_to post_path
    else
      render login_path
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    # @like = Like.new
    @comment = @post.comments.build
    @comments = @post.comments
  end

  private

    def post_params
      params.require(:post).permit(:comment)
    end
    
end
