class UserMailer < Devise::Mailer
  default from: ENV["DEFAULT_EMAIL"]
  helper :application

  def welcome_email
    @user = params[:user]
    @url = "https://odinbook-jiuf.onrender.com"
    mail(to: @user.email, subject: "Welcome to Odinbook")
  end
end
