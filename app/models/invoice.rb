class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.for_invoice_item(invoice_item_id)
    joins(:invoice_items).where(invoice_items: {id: invoice_item_id}).first
  end

  def self.for_transaction(transaction_id)
    joins(:transactions).where(transactions: {id: transaction_id}).first
  end
end
