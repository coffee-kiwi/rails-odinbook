class FollowerRequestsController < ApplicationController
  def create
    @follower_request = current_user.follower_requests.create!(status: :pending, recipient_id: follower_request_params)

    if @follower_request
      redirect_to users_path, notice: "Follow request sent"
    else
      redirect_to users_path, notice: "Failed to send request"
    end
  end

  def destroy
    @follower_request = FollowerRequest.find(params[:id])
    @follower_request.destroy()
    redirect_to users_path, notice: "Follow request declined"
  end

  private
  def follower_request_params
    params.expect([ :recipient ])
  end
end
