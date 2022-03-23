class Book < ApplicationRecord
  
  #validates :is_active, presence: true

  after_create :set_total_available
  
  has_many :loans
  has_many :users, through: :loans

  def set_total_available
    self.total_available = self.quantity
    self.save
  end


end
