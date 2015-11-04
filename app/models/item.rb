class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  before_create :money_converter

  default_scope { order(:id) }

  protected

  def money_converter
    self.unit_price = (self.unit_price.to_f/100)
  end
end
