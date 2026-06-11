class FollowerRequestsController < ApplicationController
    # def new
  #   @follower_request = FollowerRequest.new
  # end

  def create
    @follower_request = current_user.follower_requests.create!(status: :pending)

    if @follower_request
      redirect_to current_user_path, notice: "Follow request sent"
    else
      redirect_to current_user_path, notice: "Failed to send request"
    end
  end
end
# end
