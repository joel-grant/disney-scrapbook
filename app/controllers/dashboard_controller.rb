class DashboardController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])

    if !@user
      redirect_to login_path, alert: "You must be logged in."
    end
  end
end
