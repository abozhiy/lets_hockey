class UserSessionsController < ApplicationController
  before_filter :require_no_user, only: [:new, :create]
  before_filter :require_user, only: :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    # current_user_session.destroy if current_user_session  # Это потребуется, если убрать проверку require_user и require_no_user в коллбэках

    # @user = User.find_by(login: params[:user_session][:login])
    # check_for_valid_password

    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successful signed in"
      redirect_to root_path
    else
      flash[:notice] = "Unsuccessful signed in, try again or connect with support"
      render action: :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Successful signed out"
    redirect_to new_user_sessions_path
  end

  private

  # def check_for_valid_password
  #   unless @user.nil?
  #     user_not_found unless @user.valid_password?(params[:user_session][:password])
  #   else
  #     user_not_found
  #   end
  # end
end
