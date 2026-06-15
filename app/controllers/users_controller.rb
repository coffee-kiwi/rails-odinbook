class UsersController < ApplicationController
  def index
    @users = User.all
    @my_pending_requests = FollowerRequest.where("user_id = ? AND status = ?", current_user.id, 1)
    @my_accepted_requests = FollowerRequest.where("user_id = ? AND status = ?", current_user.id, 2)
    @follow_requests = FollowerRequest.where("recipient_id = ? AND status = ?", current_user.id, 1)
  end

  def show
    find_user
    @posts = @user.posts.sort_by { |post| post.created_at }.reverse
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
