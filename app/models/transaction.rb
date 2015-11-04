class Transaction < ActiveRecord::Base
  belongs_to :invoice
  has_many :customers, through: :invoice
  # belongs_to :customer, through: :invoices
end
