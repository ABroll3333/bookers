class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:success] = 'Book was successfully destroyed.'
      flash.keep
      redirect_to books_path  # Bookの一覧画面にリダイレクト
    else
      render 'edit'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = 'Book was successfully updated.'
      redirect_to book_path(@book)
    else
      @errors = @book.errors.full_messages
      render 'edit'
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
