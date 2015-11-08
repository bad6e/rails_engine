require 'rails_helper'

RSpec.describe Api::V1::Invoices::InvoiceItemsController, type: :controller do

  describe "GET /api/vi/invoices" do
    it "returns an invoice's invoice_items" do
      @customer2 = Customer.create
      @merchant2 = Merchant.create
      @invoice2  = Invoice.create(customer_id: @customer2.id, merchant_id: @merchant2.id)
      ii1        = InvoiceItem.create(invoice_id: @invoice2.id)
      ii2        = InvoiceItem.create(invoice_id: @invoice2.id)

      get :index, invoice_id: @invoice2.id, format: :json
      expect(response_data.count).to eq(2)
    end
  end
end

