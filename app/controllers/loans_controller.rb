class LoansController < ApplicationController
  
  protect_from_forgery except: :create # this is for auth error

  def index
    loans = Loan.all

    render json: { data: loans }, status: :ok
  end

  def create

    user = User.find(params[:loan][:user_id])
    
    book = Book.find(params[:loan][:book_id])
    
    if (book.total_available > 0)
      loan = Loan.new(loan_params)
      #debugger
      loan.loan_date = Time.now
      if loan.save 
        render json: { data: loan }, status: :created
      end
    else
      render json: { error: 'Out of stock' }, status: :bad_request
    end

  end

  def return_book 
    loan = Loan.find(params[:id])

    if loan.return_date 
      render json: { meessage: 'This book has been returned'}, status: :bad_request
      return
    end

    loan.return_date = Time.now
    if loan.save
      render json: { data: loan }, status: :ok
    else
      render json: { error: loan.errors.full_messages }, status: :bad_request
    end

    

  end

  def loan_params
    params.require(:loan).permit(:user_id, :book_id)
  end
end
