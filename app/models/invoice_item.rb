class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice

  before_create :money_converter

  scope :successful, -> { joins(:transactions)
                          .where("transactions.result" => "success") }

  protected

  def money_converter
    self.unit_price = (self.unit_price.to_f/100)
  end
end
