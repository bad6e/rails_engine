class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices

  def total_revenue
    total = invoice_items.joins(:transactions).where(transactions: { result: 'success' }).sum("quantity * unit_price").to_s

  end
end
