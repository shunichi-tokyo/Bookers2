class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book.user_id = current_user.id
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(current_user)
    else
      render :book_path
    end
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(current_user)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end