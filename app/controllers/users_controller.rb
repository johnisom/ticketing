class UsersController < ApplicationController
  before_action :require_no_user

  # GET /signup
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Thanks for signing up, #{@user.name}!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user)
      .permit(:name, :email_address, :password, :password_confirmation)
  end
end
