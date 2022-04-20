class Public::CatsController < ApplicationController
  before_action :authenticate_customer!
  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.customer_id = current_customer.id
    if @cat.save
      redirect_to cat_path(@cat)
    else
      render:new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    if @cat.customer == current_customer
      render "edit"
    else
      redirect_to customer_path(current_customer)
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if  @cat.update(cat_params)
        redirect_to cat_path(@cat)
    else
        render:edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:cat_name, :gender, :introduction, :other, :cat_image)
  end

end
