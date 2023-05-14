class BooksController < ApplicationController
  def index
    @books=Book.all
    @book=Book.new
  end
  def show
    @books=Book.all
    @book=Book.find(params[:id])
  end
  def edit
    @books=Book.all
    @book=Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "投稿に成功しました"
      redirect_to book_path(@book.id)
    else
      flash[:alret] = "投稿に失敗しました"
      @books=Book.all
      render :index
    end

  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end

