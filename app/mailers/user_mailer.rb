# frozen_string_literal: true

# Mailer for users
class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Deadline Tracker for UBC Students')
    # mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
