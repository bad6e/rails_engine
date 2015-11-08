require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::InvoicesController, type: :controller do

  describe "GET /api/vi/invoice_items" do

    it "returns an invoice item's invoice" do
      @invoice       = Invoice.create
      @invoice_item  = InvoiceItem.create(invoice_id: @invoice.id)

      get :show, id: @invoice_item.id, format: :json
      expect(response_data["id"]).to eq(@invoice.id)
    end
  end
end