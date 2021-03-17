
# Controller for Signup
class SignupController < ApplicationController
  def index
  end

  def submit
    @user = User.new(user_params)
  end

  def user_params
   user.require(:user).permit(:email, :password, :retype)
  end

  def create
      render plain: params[:userCreate].inspect
  end

  def new

  end

  def signup

  end

  def show

  end
end
