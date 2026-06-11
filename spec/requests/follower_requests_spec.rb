require 'rails_helper'
require 'capybara/rspec'
require 'capybara/rails'

RSpec.describe "FollowerRequests", type: :feature do
  describe "Post" do
    let(:user) { User.create!(email: "test@example.com", password: "123456") }
    let(:user2) { User.create!(email: "test2@example.com", password: "123456") }
    context "Sends a follow request" do
      it 'Successfully sends follow request to correct user' do
        visit "/users"

        click_button "Ask to Follow"

        assert_test "Follow request sent"
      end
    end
  end
end
