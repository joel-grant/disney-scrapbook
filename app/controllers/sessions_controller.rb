class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      Rails.logger.info "User #{user.id} logged in successfully. Redirecting to dashboard."
      redirect_to dashboard_index_path, notice: "Bibbidi Bobbidi Boo! Have a magical day!"
    else
      Rails.logger.warn "Failed login attempt for email: #{params[:email]}"
      flash.now[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    Rails.logger.info "User logged out successfully."
    redirect_to root_path, notice: "You have been logged out.  See you real soon!"
  end
end
