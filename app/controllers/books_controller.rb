class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
     @book = current_user.books.create(book_params)
     if @book.save
      redirect_to books_path
     else
      render :new
     end
  end

  def new_book
    if params[:course]
      @books = Book.where(course: params[:course]).where.not(user_id: current_user.id)
    elsif current_user
      @books = Book.where.not(user_id: current_user.id)
    else
       @books = Book.all
    end
   end

  def show
    @book = Book.find(params[:id])
  end

  def new_buy
    if params[:course]
      @books = Book.where(course: params[:course]).where.not(user_id: current_user.id)
    elsif current_user
      @books = Book.where.not(user_id: current_user.id)
    else
       @books = Book.all
    end
  end

  private

  def book_params
    params.require(:book).permit(:degree, :course,:book_name, :price, :user_id, images: [], )
  end
end
