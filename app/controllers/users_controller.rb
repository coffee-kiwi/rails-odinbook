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

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    avatar_param = params.dig(:user, :avatar)

    @user.avatar.attach(avatar_param) if avatar_param.present?
      if @user.update(update_params.except(:avatar))
        redirect_to @user, notice: "Profile successfully updated"
      else
       render :edit, status: :unprocessable_entity
      end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def update_params
      params.expect(user: [ :username, :bio, :avatar ])
  end

  def avatar_params
    params.expect(user: [ :avatar ])
  end

end
