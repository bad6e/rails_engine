require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "GET /api/vi/items" do

    it "tests the #index" do
      get :index, format: :json
      expect(response).to have_http_status(200)
    end

    it "tests the #index returns the right item attributes" do
      merchant = Merchant.create(name: "Trek")
      item     = Item.create(name: "Item1", merchant_id: merchant.id)
      get :index, format: :json
      expect(response_data.first["name"]).to eq ("Item1")
    end

    it "tests the #show returns the one item" do
      merchant_b = Merchant.create(name: "Same")
      item       = Item.create(name: "Item2", merchant_id: merchant_b.id)
      get :show, format: :json, id: item.id
      expect(response_data["name"]).to eq("Item2")
    end

    it "tests the #find returns the item" do
      merchant_c    = Merchant.create(name: "Hurley")
      item          = Item.create(name: "Item3", merchant_id: merchant_c.id)
      get :find, format: :json, id: item.id
      expect(response_data["id"]).to eq (item.id)
      expect(response_data["name"]).to eq("Item3")
    end

    it "tests the #find_all returns all the items" do
      @item_one = Item.create(name: "Hi")
      @item_four  = Item.create(name: "Hi")
      get :find_all, format: :json, name: @item_one.name
      expect(response_data.count).to eq (2)
    end

    it "returns a random item" do
      merchant_d = Merchant.create(name: "Late")
      item       = Item.create(name: "Item44", merchant_id: merchant_d.id)
      get :random, format: :json
      expect(response_data.first["name"]).to eq("Item44")
    end
  end
end
