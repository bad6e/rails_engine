class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices
  has_many :invoice_items, through: :invoices

  def favorite_merchant
    merchant = transactions.where(result: "success")
    .map {|r| r.invoice.merchant}
    id = merchant.max_by{|x| merchant.count(x)}.id
  end
end
