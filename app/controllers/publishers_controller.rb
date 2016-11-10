class PublishersController < ApplicationController
  def index
    @publishers = Publisher.all
  end

  def show
    @publisher = Publisher.find(params[:id])
    @publishers = Publisher.all
    @categories = Category.all
    @books = @publisher.books
  end

  def new
    @page_title = 'Bookstore | Add Publisher'
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:notice] = 'New publisher added successfully'
      redirect_to publishers_path 
    else
      render 'new' 
    end
    
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def update
    @publisher = Publisher.find(params[:id])
      if @publisher.update(publisher_params)
        flash[:notice] = 'Publisher details updated successfully'
        redirect_to publishers_path
      else
        render 'edit'
      end
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    if @publisher.destroy
      flash[:notice] = 'Publisher removed successfully'
      redirect_to publishers_path
    else
      render 'index'      
    end
  end

  private 
    def publisher_params
      params.require(:publisher).permit(:name)
    end
end
