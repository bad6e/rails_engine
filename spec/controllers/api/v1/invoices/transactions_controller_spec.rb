require 'rails_helper'

RSpec.describe Api::V1::Invoices::TransactionsController, type: :controller do
  describe "GET /api/vi/invoices" do
    it "returns an invoices' transacations" do
      @customer_one = Customer.create
      @merchant_one = Merchant.create
      @invoice_one  = Invoice.create(customer_id: @customer_one.id, merchant_id: @merchant_one.id)
      transacation1 = Transaction.create(invoice_id: @invoice_one.id)
      transacation2 = Transaction.create(invoice_id: @invoice_one.id)

      get :index, invoice_id: @invoice_one.id, format: :json
      expect(response_data.count).to eq(2)
    end
  end
end
