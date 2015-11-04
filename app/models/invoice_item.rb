class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  # belongs_to :customer, through: :invoices

  before_create :money_converter

  protected

  def money_converter
    self.unit_price = (self.unit_price.to_f/100)
  end
end
