class CategoriesController < ApplicationController
  def index
    @parents = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items
  end
end

