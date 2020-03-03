class PostsController < ApplicationController
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


  private

    def post_params
      params.require(:post).permit(
        :content
      )
    end
    
  
  
end
