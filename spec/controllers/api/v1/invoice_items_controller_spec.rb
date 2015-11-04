require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  before(:each) do
    @item              = Item.create
    @invoice           = Invoice.create
    @invoice_item      = InvoiceItem.create(item_id: @item.id, invoice_id: @invoice.id)
  end

  describe "GET /api/vi/invoice_items" do

    it "tests the #index" do
      get :index, format: :json
      expect(response).to have_http_status(200)
    end

    it "tests the #index returns the right invoice_item attributes" do
      get :index, format: :json
      response_data = JSON.parse(response.body)[0]
      expect(response_data["invoice_id"]).to eq (@invoice.id)
    end

    it "tests the #show returns the one item" do
      get :show, format: :json, id: @invoice_item.id
      response_data = JSON.parse(response.body)
      expect(response_data["invoice_id"]).to eq (@invoice.id)
    end

    it "tests the #find returns the transaction" do
      get :find, format: :json, id: @invoice_item.id
      response_data = JSON.parse(response.body)
      expect(response_data["invoice_id"]).to eq (@invoice.id)
    end

    it "tests the #find_all returns all the transaction with name of Travis" do
      get :find_all, format: :json, name: @invoice_item.id
      response_data = JSON.parse(response.body)
      expect(response_data.count).to eq (1)
    end

    it "returns a random merchant" do
      get :random, format: :json
      response_data = JSON.parse(response.body).first
      expect(response_data["item_id"]).to eq(@item.id)
    end
  end
end
