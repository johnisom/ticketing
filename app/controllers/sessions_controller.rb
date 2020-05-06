class SessionsController < ApplicationController
  before_action :require_user, only: :destroy
  before_action :require_no_user, except: :destroy

  # GET /login
  def new
  end

  # POST /login
  def create
    user = User.find_by(email_address: params[:email_address])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash[:danger] = 'There is something wrong with your login credentials.'
      render :new
    end
  end

  # GET /logout
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You logged out.'
    redirect_to root_path
  end
end
