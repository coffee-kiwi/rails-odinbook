class UsersController < ApplicationController
  def index
    @users = User.all
    @my_pending_requests = FollowerRequest.where(user_id: current_user.id, status: :pending)
    @my_accepted_requests = FollowerRequest.where(user_id: current_user.id, status: :accepted)
    @follow_requests = FollowerRequest.where(recipient_id: current_user.id, status: :pending)
  end

  def show
    find_user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
