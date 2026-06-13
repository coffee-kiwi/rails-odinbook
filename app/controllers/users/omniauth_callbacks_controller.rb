class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  #   PROVIDERS = {
  #     "google_oauth2" => "Google",
  #     "github" => "Github"
  # }.freeze

  #   def google_oauth2
  #     handle_auth("google_oauth2")
  #   end

  #   def github
  #     handle_auth("github")
  #   end

  #   def failure
  #     redirect_to root_path, alert: I18n.t("devise.omniauth_callbacks.failure")
  #   end

  #   private

  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t("devise.omniauth_callbacks.success", kind: "Google")
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url, alert: "Something went wrong. Please try again."
    end
  end

  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t("devise.omniauth_callbacks.success", kind: "GitHub")
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.github_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url, alert: "Something went wrong. Please try again."
    end
  end
end
