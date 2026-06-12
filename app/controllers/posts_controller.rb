class PostsController < ApplicationController
  def index
    @posts = Post.all
    @my_liked_posts = Like.all.where("user_id = ?", current_user.id)
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.create!(post_params)
    if post
      redirect_to posts_path, notice: "Post successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find([ params[:id] ])
    @post.delete
    redirect_to posts_path, notice: "Post removed with no trouble"
  end

  private

  def post_params
    params.expect(post: [ :body ])
  end
end
