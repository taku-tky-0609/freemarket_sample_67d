class CategoriesController < ApplicationController
  def index
    @parents = Category.all
  end
end
