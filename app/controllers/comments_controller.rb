class CommentsController < ApplicationController
  def index
    @post = Post.find(post_params)
    @comments = @post.comments
  end

  def new
    @post = Post.find(post_params)
    @new_comment = @post.comments.new
  end

  def create
    @post = Post.find(post_params)
    @new_comment = @post.comments.create!(body: comment_params, user_id: user_id)

    respond_to do |format|
      if @new_comment
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.expect([ :post_id ])
  end

  def comment_params
    body = params.expect([ comment: :body ])
    body[:body]
  end

  def user_id
    current_user.id
  end
end
