class Transaction < ActiveRecord::Base
  belongs_to :invoice
  has_many :customers, through: :invoice

  scope :successful, -> { where("result" => "success") }

  def self.transactions_for_customers(customer_id)
    joins(:invoice).where(invoices: {customer_id: customer_id})
  end
end
