class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  before_create :money_converter

  default_scope { order(:id) }

  def self.for_invoice_item(invoice_item_id)
    joins(:invoice_items).where(invoice_items: {id: invoice_item_id}).first
  end

  protected

  def money_converter
    self.unit_price = (self.unit_price.to_f/100)
  end
end
