class BooksController < ApplicationController
  
  before_action :is_matching_login_book, only: [:create, :destroy, :edit, :update]
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  def create
    @book = Book.new(book_params)
    @books = Book.all
    @user = current_user
    @book.user_id = current_user.id
     
    if @book.save
       flash[:notice] = "You have created book successfully."
       redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def show
    @books = Book.find(params[:id])
    @user = current_user
    @book = Book.new
  end
  
  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
     @book = Book.find(params[:id])
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_book
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
    redirect_to books_path
  end
  end

end
