require 'rails_helper'

RSpec.describe Api::V1::Customers::InvoicesController, type: :controller do

  describe "GET /api/vi/customers" do

    it "returns a customers's invoices" do
      @customer_one  = Customer.create(first_name: "Bob")
      invoice1       = Invoice.create(customer_id: @customer_one.id)
      invoice2       = Invoice.create(customer_id: @customer_one.id)
      invoice3       = Invoice.create(customer_id: @customer_one.id)

      get :index, customer_id: @customer_one.id, format: :json
      expect(response_data.count).to eq(3)
    end
  end
end
