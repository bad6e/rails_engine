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
      response_data = JSON.parse(response.body)[0]
      expect(response_data["name"]).to eq("Trek")
    end

    it "tests the #show returns the one merchant" do
      merchant_b = Merchant.create(name: "Same")
      get :show, format: :json, id: merchant_b.id
      response_data = JSON.parse(response.body)
      expect(response_data["name"]).to eq("Same")
    end

    it "tests the #find returns the merchant" do
      @merchant_two = Merchant.create(name: "Hurley")
      get :find, format: :json, name: @merchant_two.name
      response_data = JSON.parse(response.body)

      expect(response_data["id"]).to eq (@merchant_two.id)
      expect(response_data["name"]).to eq("Hurley")
    end

    it "tests the #find_all returns all the merchants with name of Travis" do
      @merchant_three = Merchant.create(name: "Hi")
      @merchant_four  = Merchant.create(name: "Hi")
      get :find_all, format: :json, name: @merchant_three.name
      response_data = JSON.parse(response.body)

      expect(response_data.count).to eq (2)
    end
  end
end
