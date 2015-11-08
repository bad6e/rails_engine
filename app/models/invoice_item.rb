class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice

  before_create :money_converter

  scope :successful, -> { joins(:transactions)
                          .where("transactions.result" => "success") }


  def self.invoice_items_for_item(item_id)
    joins(:item).where(items: {id: item_id})
  end

  protected

  def money_converter
    self.unit_price = (self.unit_price.to_f/100)
  end
end
