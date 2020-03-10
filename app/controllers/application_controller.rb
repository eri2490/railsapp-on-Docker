class ApplicationController < ActionController::Base
  # before_action :set_current_user

  include SessionsHelper
  
  # def set_current_user
  #   @current_user = User.find_by(id: params[:id])
  # end

  # def authenticate_user
  #   if @current_user == nil
  #     flash[:notice] = "ログインが必要です"
  #     redirect_to(root_path)
  #   end
  # end
  
  

end
