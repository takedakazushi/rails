class BooksController < ApplicationController
  def index
    @books=Book.all
    @book=Book.new
  end
  def show
    @books=Book.all
  end
  def edit
    @books=Book.all
  end
  def new
    @book = Book.all
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
    # 1.&2.
    book = Book.new(book_params)
    # 3 .
    book.save
    # 4.
    redirect_to '/top'
  end
  private
  def book_params
    params.require(:book).permmit(:title, :body)
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to 'books'
  end
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

