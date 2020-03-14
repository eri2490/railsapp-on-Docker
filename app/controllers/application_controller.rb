class ApplicationController < ActionController::Base
  include SessionsHelper
  
  # def set_current_user
  #   @current_user = User.find_by(id: params[:id])
  # end

  private

    # ログインの確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
      end
    end
end
