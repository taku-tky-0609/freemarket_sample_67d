class CategoriesController < ApplicationController
  def index
    @parents = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @categories = @category.items
    
    # @categoryparents = @category.parent.items
  end
end

