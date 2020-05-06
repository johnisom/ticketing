class UsersController < ApplicationController
  # GET /signup
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'Thanks for signing up!'
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
