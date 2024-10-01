class PostsController < ApplicationController
  before_action :require_authentication

  def index
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |f|
      if @post.save
        format.turbo_stream
      else
        format.html do
          flash[:post_errors] = @post.errors.full_messages
          redirect_to root_path
        end
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "Post has been successfully deleted."
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
