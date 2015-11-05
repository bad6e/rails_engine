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
      expect(response_data.first["merchant_id"]).to eq (@merchant.id)
    end

    it "tests the #show returns the one item" do
      get :show, format: :json, id: @invoice.id
      expect(response_data["merchant_id"]).to eq (@merchant.id)
    end

    it "tests the #find returns the invoice" do
      get :find, format: :json, id: @invoice.id
      expect(response_data["merchant_id"]).to eq (@merchant.id)
    end

    it "tests the #find_all returns all the invoice" do
      get :find_all, format: :json, name: @invoice.id
      expect(response_data.count).to eq (1)
    end

    it "returns a random invoice" do
      get :random, format: :json
      expect(response_data.first["customer_id"]).to eq(@customer.id)
    end

    it "returns an invoices' transacations" do
      @customer_one = Customer.create
      @merchant_one = Merchant.create
      @invoice_one  = Invoice.create(customer_id: @customer_one.id, merchant_id: @merchant_one.id)
      transacation1 = Transaction.create(invoice_id: @invoice_one.id)
      transacation2 = Transaction.create(invoice_id: @invoice_one.id)

      get :transactions, invoice_id: @invoice_one.id, format: :json
      expect(response_data.count).to eq(2)
    end

    it "returns an invoice's invoice_items" do
      @customer2 = Customer.create
      @merchant2 = Merchant.create
      @invoice2  = Invoice.create(customer_id: @customer2.id, merchant_id: @merchant2.id)
      ii1        = InvoiceItem.create(invoice_id: @invoice2.id)
      ii2        = InvoiceItem.create(invoice_id: @invoice2.id)

      get :invoice_items, invoice_id: @invoice2.id, format: :json
      expect(response_data.count).to eq(2)
    end

    it "returns an invoice's items, an invoice customer, and an invoice merchant" do
      @customer3 = Customer.create
      @merchant3 = Merchant.create
      @invoice3  = Invoice.create(customer_id: @customer3.id, merchant_id: @merchant3.id)
      item1      = Item.create
      item2      = Item.create
      ii1        = InvoiceItem.create(invoice_id: @invoice3.id, item_id: item1.id)
      ii2        = InvoiceItem.create(invoice_id: @invoice3.id, item_id: item2.id)


      get :items, invoice_id: @invoice3.id, format: :json
      expect(response_data.count).to eq(2)

      get :customer, invoice_id: @invoice3.id, format: :json
      expect(response_data["id"]).to eq(@customer3.id)

      get :merchant, invoice_id: @invoice3.id, format: :json
      expect(response_data["id"]).to eq(@merchant3.id)
    end
  end
end
