class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # сделать указанные методы видимыми из шаблонов.
  helper_method :current_user_session, :current_user

  private

  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def current_user
    @current_user ||= current_user_session.try(:record)
  end

  def require_user
    unless current_user
      # store_location
      # flash[:alert] = "You must be logged in to access this page"
      redirect_to new_user_sessions_path
      return false
    end
  end

  def require_no_user
    if current_user
      # store_location
      # flash[:alert] = "You must be logged out to access this page"
      redirect_to root_path
      return false
    end
  end

  # def store_location
  #   session[:return_to] = request.request_uri
  # end

  def user_not_found
    flash[:alert] = "Incorrect login or password"
    redirect_to new_user_sessions_path
  end
end
