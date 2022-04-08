class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    # @customer = current_customer
    @cats = @customer.cats
    @posts = @customer.posts
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :introduction, :email, :profile_image)
  end
end
