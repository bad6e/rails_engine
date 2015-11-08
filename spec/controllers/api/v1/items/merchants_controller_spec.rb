require 'rails_helper'

RSpec.describe Api::V1::Items::MerchantsController, type: :controller do

  describe "GET /api/vi/items" do
     it "returns an item's merchant" do
      merchant_e = Merchant.create(name: "Samwise")
      item1      = Item.create(name: "Item46", merchant_id: merchant_e.id)

      get :show, id: item1.id, format: :json
      expect(response_data["id"]).to eq(merchant_e.id)
    end
  end
end
