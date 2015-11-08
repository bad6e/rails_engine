require 'rails_helper'

RSpec.describe Api::V1::Customers::TransactionsController, type: :controller do

  describe "GET /api/vi/customers" do

    it "returns a customers's transacations" do
      @customer_two      = Customer.create(first_name: "Don")
      @invoice1          = Invoice.create(customer_id: @customer_two.id)
      @invoice2          = Invoice.create(customer_id: @customer_two.id)
      transaction1       = Transaction.create(invoice_id: @invoice1.id)
      transaction2       = Transaction.create(invoice_id: @invoice2.id)

      get :index, customer_id: @customer_two.id, format: :json
      expect(response_data.count).to eq(2)
    end
  end
end
