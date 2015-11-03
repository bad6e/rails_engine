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
      response_data = JSON.parse(response.body).first

      expect(response_data["id"]).to eq (customer.id)
      expect(response_data["first_name"]).to eq("Bret")
      expect(response_data["last_name"]).to eq("Doucette")
    end

    it "tests the #show returns the one customer" do
      customer_b = Customer.create(first_name: "Bret1", last_name: "Doucette1")
      get :show, format: :json, id: customer_b.id
      response_data = JSON.parse(response.body)
      expect(response_data["first_name"]).to eq("Bret1")
    end

    it "tests the #find returns the customer" do
      @customer_two = Customer.create(first_name: "Travis", last_name: "Haby")
      get :find, format: :json, first_name: @customer_two.first_name
      response_data = JSON.parse(response.body)

      expect(response_data["id"]).to eq (@customer_two.id)
      expect(response_data["first_name"]).to eq("Travis")
      expect(response_data["last_name"]).to eq("Haby")
    end

    it "tests the #find_all returns all the customers with name of Travis" do
      @customer_three = Customer.create(first_name: "Mimi", last_name: "Schatz")
      @customer_four  = Customer.create(first_name: "Mimi", last_name: "Samson")
      get :find_all, format: :json, first_name: @customer_three.first_name
      response_data = JSON.parse(response.body)

      expect(response_data.count).to eq (2)
    end
  end

end
