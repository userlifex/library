class BooksController < ApplicationController

  protect_from_forgery except: :create # this is for auth error


  def index
    books = Book.where(is_active: true)
    render json: { data: books }, status: :ok
  end


  def show
    book = Book.find(params[:id])
    if book.is_active
      render json: { data: book}, status: :ok
    else
      render json: { message: "book not found" }, status: :not_found
    end
  end


  def create
    book = Book.new(book_params)
    if book.save
      render json: { data: book }, status: :created
    else
      render json: { data: book.errors.full_messages }, status: :bad_request
    end
  end

  def update
    book = Book.find(params[:id])

    if book.is_active
      book.update(book_params)
      if book.save
        render json: { data: book }, status: :ok
      else
        render json: { data: book.errors.full_messages }, status: :bad_request
      end
    else
      render json: { message: "Book not found" }, status: :not_found
    end
  end

  def destroy

    book = Book.find(params[:id])

    if book.is_active
      book.is_active = false
      if book.save
        render json: { message: "The book has benn deleted" }, status: :ok
      else
        render json: { data: book.errors.full_messages }, status: :bad_request
      end
    else
      render json: { message: "Book not found" }, status: :not_found
    end
  end

  def book_params 
    params.require(:book).permit(:title, :author, :quantity, :release_date)
  end


end
