class Public::PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
