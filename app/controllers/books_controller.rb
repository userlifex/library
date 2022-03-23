class BooksController < ApplicationController

  protect_from_forgery except: :create # this is for auth error


  def index
    books = Book.all
    render json: { data: books }, status: :ok
  end


  def show
    book = Book.find(params[:id])
    render json: { data: book }, status: :ok
  end


  def create
    book = Book.new(book_params)
    if book.save
      render json: { data: book }, status: :ok
    else
      render json: { data: book.errors.full_messages }, status: :bad_request
    end
  end

  def update
    book = Book.find(params[:id])
    render json: { data: user }, status: :ok
  end

  def destroy
  end

  def book_params 
    params.require(:book).permit(:title, :author, :quantity)
  end


end
