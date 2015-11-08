require 'rails_helper'

RSpec.describe Api::V1::Transactions::InvoicesController, type: :controller do

  describe "GET /api/vi/transactions" do
    it "returns a transactions invoice" do
      @invoice     = Invoice.create
      @transaction = Transaction.create(invoice_id: @invoice.id)
      get :show, id: @transaction.id, format: :json
      expect(response_data["id"]).to eq(@invoice.id)
    end
  end
end

