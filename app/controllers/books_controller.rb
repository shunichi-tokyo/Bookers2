class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    book.save
    @books = Book.all
    redirect_to books_path
  end

  def show
  end

  def destroy
  end

  private

  def book_path
    params.require(:book).permit(:title, :body)
  end

end