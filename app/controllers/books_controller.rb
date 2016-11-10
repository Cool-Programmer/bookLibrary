class BooksController < ApplicationController

  def index
    @books = Book.all
    @categories = Category.all
  end

  def show
    @book = Book.find(params[:id])
    @categories = Category.all
  end

  def new
    @page_title = 'Bookstore | Add Book'
    @book = Book.new
    @author = Author.new
    @category = Category.new
    @publisher = Publisher.new
  end

  def create
    @book = Book.new(book_params)
      if @book.save
        flash[:notice] = 'Book added successfully'
        redirect_to books_path    
      else
        render 'new'
      end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book details updated successfully'
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = 'Book removed'
      redirect_to books_path
    end
  end

  protected
    def book_params
      params.require(:book).permit(:title, :category_id, :author_id, :publisher_id, :isbn, :price, :description, :buy, :format, :pages, :year, :coverpath)
    end
end
