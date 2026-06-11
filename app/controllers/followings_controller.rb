class FollowingsController < ApplicationController
  def create
    following = Following.create!(followed_users_id: current_user.id, followers_id: follower_params)
    if following
      FollowerRequest.find_by(id: follower_request_params).accepted!
      redirect_to users_path, notice: "You have a new follower"
    else
      redirect_to users_path, notice: "Oops, somethign went wrong"
    end
  end

  private

  def follower_params
    params.expect([:follower])
  end 

  def follower_request_params
    params.expect([:request])
  end
end
