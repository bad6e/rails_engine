require 'rails_helper'

RSpec.describe Api::V1::Merchants::ItemsController, type: :controller do

  describe "GET /api/vi/merchants" do

    it "returns a merchant's items" do
      @merchant_four = Merchant.create(name: "Death")
      item1          = Item.create(name: "A", merchant_id: @merchant_four.id)
      item2          = Item.create(name: "B", merchant_id: @merchant_four.id)
      item3          = Item.create(name: "C", merchant_id: @merchant_four.id)

      get :index, merchant_id: @merchant_four.id, format: :json
      expect(response_data.count).to eq(3)
    end
  end
end
