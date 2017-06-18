class UsersController < ApplicationController
  before_filter :require_no_user, only: [:new, :create]
  before_filter :require_user, only: :index

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:alert] = "User was successfuly created"
      redirect_to root_path
    else
      flash[:alert] = "User wasn't created, try again"
      render action: :new
    end
  end

  # def show
  #   @user = @current_user
  # end
  #
  # def edit
  #   @user = @current_user
  # end
  #
  # def update
  #   @user = @current_user # makes our views "cleaner" and more consistent
  #   if @user.update_attributes(params[:user])
  #     flash[:notice] = "Account updated!"
  #     redirect_to account_url
  #   else
  #     render :action => :edit
  #   end
  # end

  private

  def users_params
    params.require(:user).permit([:first_name, :last_name, :middle_name, :nickname, :phone, :login, :email, :position])
  end
end
