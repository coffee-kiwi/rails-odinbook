require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "test@example.com", password: "123456") }
  context "test associations" do
      it 'users has many posts' do
        user.posts.create!(body: "This is a post")
        expect(user.posts).to be_present
  end
  end


  it 'destroys dependent posts' do
    post1 = user.posts.create!(body: "This is a post")
    user.destroy()
    expect(Post.all).to eq([])
  end
end
