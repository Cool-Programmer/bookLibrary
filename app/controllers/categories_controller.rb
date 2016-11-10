class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @books = @category.books
    # OH MY GOD 
  end

  def new
    @page_title = 'Bookstore | Add Category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    
    if @category.save
      flash[:notice] = 'Category created successfully.'
      redirect_to categories_path
    else 
      # flash[:alert] = 'Please fill up the form'
      render 'new'
    end

  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = 'Category updated successfully'
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = 'Category deleted successfully'
      redirect_to categories_path
    else
      render 'index'
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
