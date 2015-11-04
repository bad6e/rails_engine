require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do

  describe "GET /api/vi/transactions" do
    before (:each) do
      @invoice         = Invoice.create
      @transaction     = Transaction.create(invoice_id: @invoice.id)

    end

    it "tests the #index" do
      get :index, format: :json
      expect(response).to have_http_status(200)
    end

    it "tests the #index returns the right item attributes" do
      get :index, format: :json
      response_data = JSON.parse(response.body).first
      expect(response_data["invoice_id"]).to eq (@invoice.id)
    end

    it "tests the #show returns the one item" do
      get :show, format: :json, id: @transaction.id
      response_data = JSON.parse(response.body)
      expect(response_data["invoice_id"]).to eq (@invoice.id)
    end

    it "tests the #find returns the transaction" do
      get :find, format: :json, id: @transaction.id
      response_data = JSON.parse(response.body)
      expect(response_data["invoice_id"]).to eq (@invoice.id)
    end

    it "tests the #find_all returns all the transactions" do
      get :find_all, format: :json, name: @transaction.id
      response_data = JSON.parse(response.body)
      expect(response_data.count).to eq (1)
    end

    it "returns a random transaction" do
      get :random, format: :json
      response_data = JSON.parse(response.body).first
      expect(response_data["id"]).to eq(@transaction.id)
    end

    it "returns a transactions invoice" do
      get :invoice, transaction_id: @transaction.id, format: :json
      response_data = JSON.parse(response.body)
      expect(response_data["id"]).to eq(@invoice.id)
    end
  end
end
