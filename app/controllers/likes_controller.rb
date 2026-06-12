class LikesController < ApplicationController
  def create
    @post = Post.find(post_id_params)
    @like = current_user.likes.create!(@post)

    if @like
      redirect_to posts_path, notice: "Post has been liked"
    else
      redirect_to posts_path, notice: "An error has occurred"
    end
  end

  def destroy
    @like = Like.find(likes_params)
    if @like.destroy()
      redirect_to posts_path, notice: "Unliked post"
    else
      redirect_to posts_path, notice: "Unable to delete like"
    end
  end

  private

  def likes_params
    params.expect([ :id ])
  end

  def post_id_params
    params.expect([ :post ])
  end

  def user_id_params
    current_user.id
  end
end
