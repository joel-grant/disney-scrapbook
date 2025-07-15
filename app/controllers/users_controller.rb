class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Rails.logger.info "User saved successfully with ID: #{@user.id}"
      # Create a session for the user
      session[:user_id] = @user.id
      Rails.logger.info "Session set, redirecting to dashboard"
      redirect_to dashboard_index_path
    else
      Rails.logger.error "User save failed. Errors: #{@user.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
