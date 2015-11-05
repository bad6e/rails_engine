require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do

  describe "GET /api/vi/customers" do

    it "tests the #index" do
      get :index, format: :json
      expect(response).to have_http_status(200)
    end

    it "tests the #index returns the right customer attributes" do
      customer = Customer.create(first_name: "Bret", last_name: "Doucette")
      get :index, format: :json
      expect(response_data.first["id"]).to eq (customer.id)
      expect(response_data.first["first_name"]).to eq("Bret")
      expect(response_data.first["last_name"]).to eq("Doucette")
    end

    it "tests the #show returns the one customer" do
      customer_b = Customer.create(first_name: "Bret1", last_name: "Doucette1")
      get :show, format: :json, id: customer_b.id
      expect(response_data["first_name"]).to eq("Bret1")
    end

    it "tests the #find returns the customer" do
      @customer_two = Customer.create(first_name: "Travis", last_name: "Haby")
      get :find, format: :json, first_name: @customer_two.first_name

      expect(response_data["id"]).to eq (@customer_two.id)
      expect(response_data["first_name"]).to eq("Travis")
      expect(response_data["last_name"]).to eq("Haby")
    end

    it "tests the #find_all returns all the customers with name of Travis" do
      @customer_three = Customer.create(first_name: "Mimi", last_name: "Schatz")
      @customer_four  = Customer.create(first_name: "Mimi", last_name: "Samson")
      get :find_all, format: :json, first_name: @customer_three.first_name

      expect(response_data.count).to eq (2)
    end

    it "returns a random customer" do
      customer = Customer.create(first_name: "Bretistired", last_name: "Doucette!")
      get :random, format: :json
      expect(response_data.first["first_name"]).to eq("Bretistired")
    end

    it "returns a customers's invoices" do
      @customer_one  = Customer.create(first_name: "Bob")
      invoice1       = Invoice.create(customer_id: @customer_one.id)
      invoice2       = Invoice.create(customer_id: @customer_one.id)
      invoice3       = Invoice.create(customer_id: @customer_one.id)

      get :invoices, customer_id: @customer_one.id, format: :json
      expect(response_data.count).to eq(3)
    end

    it "returns a customers's transacations" do
      @customer_two      = Customer.create(first_name: "Don")
      @invoice1          = Invoice.create(customer_id: @customer_two.id)
      @invoice2          = Invoice.create(customer_id: @customer_two.id)
      transaction1       = Transaction.create(invoice_id: @invoice1.id)
      transaction2       = Transaction.create(invoice_id: @invoice2.id)

      get :transactions, customer_id: @customer_two.id, format: :json
      expect(response_data.count).to eq(2)
    end

    it "returns a customers's favorite merchant" do
      @customer_three     = Customer.create(first_name: "Don")
      @merchant_four      = Merchant.create(name: "Bob Jones")
      @invoice1           = Invoice.create(customer_id: @customer_three.id, merchant_id: @merchant_four.id)
      @invoice2           = Invoice.create(customer_id: @customer_three.id, merchant_id: @merchant_four.id)

      transaction1       = Transaction.create(invoice_id: @invoice1.id, result: 'success')
      transaction2       = Transaction.create(invoice_id: @invoice2.id, result: 'success')

      get :favorite_merchant, customer_id: @customer_three.id, format: :json
      expect(response_data["name"]).to eq("Bob Jones")
    end
  end
end
