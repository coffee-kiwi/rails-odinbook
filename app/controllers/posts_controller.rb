class PostsController < ApplicationController
  #   before_action lambda {
  #   resize_before_save(avatar_params, 300, 300)
  # }, only: [ :create ]

  def index
    @posts = Post.order(created_at: :desc)
    @followers_id = current_user.follower_requests.accepted.pluck(:recipient_id)
    @all_comments = Comment.all
    @my_liked_posts = Like.all.where("user_id = ?", current_user.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.avatar.attach(params[:avatar])
    @post = current_user.posts.build(post_params)
    if @post.save!
      redirect_to posts_path, notice: "Post successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @my_like = Like.find_by("user_id = ? AND post_id = ?", current_user.id, @post.id)
  end

  private

  def post_params
    params.expect(post: [ :body, :title, :avatar ])
  end

  def avatar_params
    params.expect(post: [ :avatar ])
  end

  def resize_before_save(image_param, width, height)
    return unless image_param

    begin
      ImageProcessing::MiniMagick
        .source(image_param)
        .resize_to_fit(width, height)
        .call(destination: image_param.tempfile.path)
    rescue StandardError => _e
      # Do nothing. If this is catching, it probably means the
      # file type is incorrect, which can be caught later by
      # model validations.
    end
  end
end
