class Loan < ApplicationRecord

  after_create :update_availability
  after_update :register_return

  belongs_to :user
  belongs_to :book



  def update_availability
    book = Book.find(self.book_id)

    book.total_available -= 1

    book.save
  end

  def register_return
    book = Book.find(self.book_id)
    
    book.total_available = book.total_available + 1

    book.save
  end
  

end
