class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @authors = Author.all
    @categories = Category.all
    @books = @author.books
  end

  def new
    @page_title = 'Bookstore | Add Author'
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save 
      flash[:notice] = "A new author added successfully"
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      flash[:notice] = 'Author details updated successfully'
      redirect_to authors_path
    else
      render 'edit'
    end
  end

  def destroy
    @author = Author.destroy(params[:id])
    if @author.destroy
      flash[:notice] = 'Author deleted successfully'
      redirect_to authors_path
    else
      render 'index'
    end
  end

  private
    def author_params
      params.require(:author).permit(:first_name, :last_name)
    end
end
