require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(email: "test@example.com", password: "123456") }
  let(:post) { user.posts.create!(body: "This is a post") }
  context "test associations" do
      it 'Test associations between user and post' do
        post.comments.create!(body: "this is a comment", user_id: user.id)
        expect(user.comments).to be_present
        expect(post.comments).to be_present
  end
  end


  it 'destroys dependent posts' do
    post.comments.create!(body: "this is a comment", user_id: user.id)
    post.destroy()
    expect(Comment.all).to eq([])
  end
end
