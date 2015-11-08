require 'rails_helper'

RSpec.describe Api::V1::Items::InvoiceItemsController, type: :controller do

  describe "GET /api/vi/items" do
     it "returns an item's invoice items" do
      item         = Item.create(name: "Item45")
      invoice_item = InvoiceItem.create(item_id: item.id)

      get :index, item_id: item.id, format: :json
      expect(response_data.count).to eq(1)
    end
  end
end
