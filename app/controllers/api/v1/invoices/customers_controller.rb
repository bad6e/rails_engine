class Api::V1::Invoices::CustomersController < Api::V1::CustomersController

  def show
    respond_with Customer.for_invoice(params["id"])
  end
end