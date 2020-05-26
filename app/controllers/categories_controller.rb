class CategoriesController < ApplicationController
  before_action :authenticate
  before_action :set_category, only: %i[show edit update destroy]

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

  def destroy
    if @category.destroy
      redirect_to categories_path, notice: 'Category was destroyed successfully'
    else
      render action: 'index', alert: "Category #{category.name} can not be destroyed"
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
