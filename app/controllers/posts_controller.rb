class PostsController < ApplicationController
require "mini_magick"
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
    resize_image_by_orientation
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @my_like = Like.find_by("user_id = ? AND post_id = ?", current_user.id, @post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Post deleted successfully"
  end
  private

  def post_params
    params.expect(post: [ :body, :title, :avatar ])
  end

  def avatar_params
    params.expect(post: [ :avatar ])
  end

  def resize_image_by_orientation
    # Adjust ':post' and ':image' to match your model name and param key
    return unless params[:post] && params[:post][:avatar]
    image_param = params[:post][:avatar]
    # Guard against non-attached avatars
    return unless image_param.respond_to?(:tempfile)
    
    # Initialize MiniMagick over the uploaded tempfile
    pipeline = ImageProcessing::MiniMagick.source(image_param.tempfile.path).auto_orient
    image = MiniMagick::Image.open(image_param.tempfile.path)
    image.auto_orient  
    # Determine orientation by comparing width and height
    if image.width > image.height
      # Landscape bounds
      pipeline = pipeline.resize_to_limit(1200, 400)
    else
      # Portrait bounds (or square)
      pipeline = pipeline.resize_to_limit(400, 600)
    end

    result = pipeline.call
    if result && File.size(result.path) > 0
      FileUtils.cp(result.path, image_param.tempfile.path)
    end
  end
end
