require 'rails_helper'

RSpec.describe Api::V1::Invoices::MerchantsController, type: :controller do
  describe "GET /api/vi/invoices" do

    it "returns an invoice's items, an invoice customer, and an invoice merchant" do
      @customer3 = Customer.create
      @merchant3 = Merchant.create
      @invoice3  = Invoice.create(customer_id: @customer3.id, merchant_id: @merchant3.id)
      item1      = Item.create
      item2      = Item.create
      ii1        = InvoiceItem.create(invoice_id: @invoice3.id, item_id: item1.id)
      ii2        = InvoiceItem.create(invoice_id: @invoice3.id, item_id: item2.id)

      get :show, id: @invoice3.id, format: :json
      expect(response_data["id"]).to eq(@merchant3.id)
    end
  end
end