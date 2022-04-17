class Public::CustomersController < ApplicationController
before_action :authenticate_customer!
  def show
    @customer = Customer.find(params[:id])
    @cats = @customer.cats
    @posts = @customer.posts.page(params[:page]).per(9)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(current_customer)
  end

  def favorites
    @customer = Customer.find(params[:id])
    favorites= Favorite.where(customer_id: @customer.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :introduction, :email, :profile_image)
  end
end
