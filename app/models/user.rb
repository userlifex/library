class User < ApplicationRecord
  has_many :loans
  has_many :books, through: :loans

  #validates :first_name, presence: true
  #validates :last_name, presence: true
  #validates :code, presence: false
end
