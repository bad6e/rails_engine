require 'rails_helper'

RSpec.describe Api::V1::Merchants::InvoicesController, type: :controller do

  describe "GET /api/vi/merchants" do

    it "returns a merchant's invoices" do
        @merchant_five = Merchant.create(name: "Don Juan")
        invoice1       = Invoice.create(merchant_id: @merchant_five.id)
        invoice2       = Invoice.create(merchant_id: @merchant_five.id)
        invoice3       = Invoice.create(merchant_id: @merchant_five.id)

        get :index, merchant_id: @merchant_five.id, format: :json
        expect(response_data.count).to eq(3)
      end
    end
  end