require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do

  describe "GET /api/vi/merchants" do

    it "tests the #index" do
      get :index, format: :json
      expect(response).to have_http_status(200)
    end

    it "tests the #index returns the right merchant attributes" do
      merchant = Merchant.create(name: "Trek")
      get :index, format: :json
      expect(response_data.first["name"]).to eq("Trek")
    end

    it "tests the #show returns the one merchant" do
      merchant_b = Merchant.create(name: "Same")
      get :show, format: :json, id: merchant_b.id
      expect(response_data["name"]).to eq("Same")
    end

    it "tests the #find returns the merchant" do
      @merchant_two = Merchant.create(name: "Hurley")
      get :find, format: :json, name: @merchant_two.name
      expect(response_data["id"]).to eq (@merchant_two.id)
      expect(response_data["name"]).to eq("Hurley")
    end

    it "tests the #find_all returns all the merchants with name of Travis" do
      @merchant_three = Merchant.create(name: "Hi")
      @merchant_four  = Merchant.create(name: "Hi")
      get :find_all, format: :json, name: @merchant_three.name
      expect(response_data.count).to eq (2)
    end

    it "returns a random merchant" do
      @merchant_three = Merchant.create(name: "Hi")
      get :random, format: :json
      expect(response_data.first["name"]).to eq("Hi")
    end

    it "returns a merchant's items" do
      @merchant_four = Merchant.create(name: "Death")
      item1          = Item.create(name: "A", merchant_id: @merchant_four.id)
      item2          = Item.create(name: "B", merchant_id: @merchant_four.id)
      item3          = Item.create(name: "C", merchant_id: @merchant_four.id)

      get :items, merchant_id: @merchant_four.id, format: :json
      expect(response_data.count).to eq(3)
    end

    it "returns a merchant's invoices" do
      @merchant_five = Merchant.create(name: "Don Juan")
      invoice1       = Invoice.create(merchant_id: @merchant_five.id)
      invoice2       = Invoice.create(merchant_id: @merchant_five.id)
      invoice3       = Invoice.create(merchant_id: @merchant_five.id)

      get :invoices, merchant_id: @merchant_five.id, format: :json
      expect(response_data.count).to eq(3)
    end

    it "hits the #revenue" do
      @merchant_six = Merchant.create(name: "Don Juan")
      get :revenue, merchant_id: @merchant_six.id, format: :json
      expect(response).to have_http_status(200)
    end

    it "hits the #most_revenue" do
      get :most_revenue, format: :json
      expect(response).to have_http_status(200)
    end

    it "hits the #customer_with_pending_invoices" do
      @merchant_seven = Merchant.create(name: "Don Juan")
      get :customers_with_pending_invoices, merchant_id: @merchant_seven.id, format: :json
      expect(response).to have_http_status(200)
    end
  end
end
