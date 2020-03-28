class PostsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create]
  
  def index
    @posts = Post.paginate(page: params[:page]).order(created_at: :desc)
    @post = Post.find_by(id: params[:id])
    # @user = User.find(params[:id])    // Comment out for Like model
    # @user = @post.user
    @like = Like.new
    @comment = Comment.new
    # @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success]  = "Posted!!!"
      redirect_to posts_path
    else
      render login_path
    end
  end

  ###### DID NOT USE show ACTION ########
  # def show
  #   @post = Post.find_by(id: params[:id])
  #   @user = @post.user                  
  #   @like = @post.likes.build
  #   @comment = @post.comments.build
  # end

  private

    def post_params
      params.require(:post).permit(:content)
    end
    
end
