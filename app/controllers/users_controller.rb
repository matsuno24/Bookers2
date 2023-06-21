class UsersController < ApplicationController
  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.new
    @books = 
    @users = User.find(params[:id])
  end

  def edit
    @users = User.find(params[:id])
  end
end
