class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: 'Category created successfully!'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category updated successfully!'
    else
      render action: 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, :description, :parent_id)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
