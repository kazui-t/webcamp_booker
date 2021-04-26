class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      redirect_to books_path, notice: "Book was successfully updated."
    else
      render action: :edit and return
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "Book was successfully created."
    else
      @books = Book.all
      render action: :index and return
    end
  end

  private
    def book_params
    params.require(:book).permit(:title, :body)
    end
    def update_params
      params .permit(:title, :body)
    end
end