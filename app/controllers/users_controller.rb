class UsersController < ApplicationController
  # before_action lambda {
  #   if avatar_params.present?
  #   resize_before_save(avatar_params, 100, 100)
  #   end  }, only: [ :update ]

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
    params[:avatar] = @user.avatar
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

  # def resize_before_save(image_param, width, height)
  #   return unless image_param

  #   begin
  #     ImageProcessing::MiniMagick
  #       .source(image_param)
  #       .resize_to_fit(width, height)
  #       .call(destination: image_param.tempfile.path)
  #   rescue StandardError => _e
  #     # Do nothing. If this is catching, it probably means the
  #     # file type is incorrect, which can be caught later by
  #     # model validations.
  #   end
  # end
end
