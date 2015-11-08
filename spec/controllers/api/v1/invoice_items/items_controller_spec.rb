require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::ItemsController, type: :controller do

  describe "GET /api/vi/items" do
    it "returns an invoice item's item" do
      @item         = Item.create
      @invoice_item = InvoiceItem.create(item_id: @item.id)

      get :show, id: @invoice_item.id, format: :json
      expect(response_data["id"]).to eq(@item.id)
    end
  end
end