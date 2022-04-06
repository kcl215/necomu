class Public::CatsController < ApplicationController
  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.customer_id = current_customer.id
    @cat.save
    redirect_to cat_path(@cat)
  end

  def edit
     @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update(cat_params)
    redirect_to cat_path(@cat)
  end

  private

  def cat_params
    params.require(:cat).permit(:cat_name, :gender, :introduction, :other, :cat_image)
  end

end