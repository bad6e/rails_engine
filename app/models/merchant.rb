class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.for_invoice(invoice_id)
    joins(:invoices).where(invoices: {id: invoice_id}).first
  end

  def self.for_item(id)
    joins(:items).where(items: {id: id}).first
  end

  def date_revenue(date = nil)
    if date
      invoice_items.joins(:invoice)
                         .where(invoices: { created_at: date } )
                         .joins(:transactions)
                         .where(transactions: {result: "success"} )
                         .sum("quantity * unit_price").to_s
    else
      invoice_items.joins(:transactions)
                         .where(transactions: { result: 'success' })
                         .sum("quantity * unit_price").to_s
    end
  end


  def pending
    transactions.joins(:customers).where(transactions: { result: 'failed' })
                .map {|r| r.customers}.flatten.uniq
  end

  def self.most_revenue(quantity)
    select("merchants. *, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .joins(:invoice_items)
    .group("merchants.id")
    .order("total_revenue DESC")
    .limit(quantity)
    .merge(InvoiceItem.successful)
  end

  def favorite_customer
    customers.select("customers.*, count(invoices.customer_id) AS invoice_count")
                    .joins(invoices: :transactions)
                    .merge(Transaction.successful)
                    .group("customers.id")
                    .order("invoice_count DESC")
                    .first
  end
end


