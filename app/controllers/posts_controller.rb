class PostsController < ApplicationController
  # before_action :authenticate_user
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success]  = "Posted!!!"
      redirect_to posts_index_path
    else
      render login_path
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end
  


  private

    def post_params
      params.require(:post).permit(
        :content
      )
    end
    
  
  
end
