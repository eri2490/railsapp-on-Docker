class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :following]

  def index
    @users = User.paginate(page: params[:page]).order(created_at: :desc)
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    @like = Like.new
    @comment = Comment.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully Signup!"
      log_in @user
      redirect_to @user
    else
      render('new')
    end
  end

  private

    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
    end

    # before_action
    
    # def correct_user
    #   @user = User.find(params[:id])
    #   redirect_to(root_url) unless current_user?
    # end
    
  
end
