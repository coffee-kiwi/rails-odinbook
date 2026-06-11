require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:user) { User.create!(email: "test@example.com", password: "123456") }
  describe "GET /posts" do
    context "when user is not logged in" do
      it "redirects to the login page" do
        get posts_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user is logged in" do
      before do
        sign_in user
      end
      it "returns successful response and lists of posts" do
        user.posts.create!(body: "happy happy")
        get posts_path
        expect(response).to have_http_status(:success)
        expect(response.body).to include("happy happy")
      end
    end
  end
end
