class GuestSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create ]
  def create
    # guest = User.find_by!(email: "guest@example.com")
    guest = User.find_by!("email = ?", "guest@example.com")
    sign_in(guest)
    redirect_to root_path
  end
end
