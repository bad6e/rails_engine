require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do
  before(:each) do
    @customer     = Customer.create
    @merchant     = Merchant.create
    @invoice      = Invoice.create(customer_id: @customer.id, merchant_id: @merchant.id)
  end

  describe "GET /api/vi/invoices" do

    it "tests the #index" do
      get :index, format: :json
      expect(response).to have_http_status(200)
    end

    it "tests the #index returns the right invoice_item attributes" do
      get :index, format: :json
      response_data = JSON.parse(response.body)[0]
      expect(response_data["merchant_id"]).to eq (@merchant.id)
    end

    it "tests the #show returns the one item" do
      get :show, format: :json, id: @invoice.id
      response_data = JSON.parse(response.body)
      expect(response_data["merchant_id"]).to eq (@merchant.id)
    end

    it "tests the #find returns the invoice" do
      get :find, format: :json, id: @invoice.id
      response_data = JSON.parse(response.body)
      expect(response_data["merchant_id"]).to eq (@merchant.id)
    end

    it "tests the #find_all returns all the invoice" do
      get :find_all, format: :json, name: @invoice.id
      response_data = JSON.parse(response.body)
      expect(response_data.count).to eq (1)
    end

    it "returns a random invoice" do
      get :random, format: :json
      response_data = JSON.parse(response.body).first
      expect(response_data["customer_id"]).to eq(@customer.id)
    end
  end
end
