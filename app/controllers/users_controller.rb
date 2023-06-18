class UsersController < ApplicationController
  def index
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end
end
