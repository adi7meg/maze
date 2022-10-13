 class UserMailer < ApplicationMailer
    default from: 'robinsh007@gmail.com'

    def welcome_email
      @users = params[:user]
      @url  = 'http://example.com/login'
      mail(to: @users.email,cc:User.all.pluck(:email),  subject: 'Welcome to My Awesome Site')
    end
  end
