class Public::PostsController < ApplicationController
before_action :authenticate_customer!
  def index
    @posts = Post.order(created_at: :desc).limit(6)
    @follow_posts = Post.where(customer_id: [current_customer.id, *current_customer.following_ids]).order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    # コメント機能
    @comment = Comment.new
    @comments = @post.comments.all.order(created_at: :asc)
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to customer_path(current_customer)
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
