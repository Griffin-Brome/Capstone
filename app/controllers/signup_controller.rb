# frozen_string_literal: true

# Controller for Signup
class SignupController < ApplicationController
  def index; end

  def user_params
    user.require(:user).permit(:email, :password)
  end

  def create
    @user_param = params[:user]

    if @user_param[:confirm_password].eql?(@user_param[:password]) && @user_param[:agree]
       .eql?('1') && !User.where(email: @user_param[:email]).exists?

      # render plain: @user_param.inspect

      # else
      # render plain: @user_param.inspect + @user_param[:confirm_password].inspect
    end
  end

  def new; end

  def signup; end

  def show; end
end
